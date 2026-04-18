import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:dio/dio.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = '/map-screen';

  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  final Dio _dio = Dio();
  LatLng? _currentLocation;
  LatLng? _selectedLocation;
  String _selectedAddress = '';
  String _selectedCity = '';
  String _selectedState = '';
  String _selectedVillage = '';
  bool _isLoading = false;
  bool _isGeocodingLoading = false;
  bool _isSearching = false;
  List<Map<String, dynamic>> _searchResults = [];
  bool _showSearchResults = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    try {
      setState(() {
        _isLoading = true;
      });
      // Check and request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showPermissionDeniedDialog();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _showPermissionDeniedDialog();
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final currentLatLng = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentLocation = currentLatLng;
        _selectedLocation = currentLatLng;
        _isLoading = false;
      });

      // Move camera to current location
      _mapController.move(currentLatLng, 15.0);

      // Get address for current location
      await _getAddressFromLatLng(currentLatLng);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog('Failed to get current location: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    setState(() {
      _isGeocodingLoading = true;
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        final address = [
          placemark.street,
          placemark.subLocality,
          placemark.locality,
          placemark.administrativeArea,
          placemark.postalCode,
          placemark.country,
        ].where((element) => element != null && element.isNotEmpty).join(', ');

        final city =
            placemark.locality ??
            placemark.subAdministrativeArea ??
            placemark.administrativeArea ??
            '';

        final state = placemark.administrativeArea ?? '';

        final village =
            placemark.subLocality ??
            placemark.thoroughfare ??
            placemark.subThoroughfare ??
            '';

        setState(() {
          _selectedAddress = address;
          _selectedCity = city;
          _selectedState = state;
          _selectedVillage = village;
        });
      }
    } catch (e) {
      print('Error getting address: $e');
    } finally {
      setState(() {
        _isGeocodingLoading = false;
      });
    }
  }

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _showSearchResults = false;
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _showSearchResults = true;
    });

    try {
      // Build the API URL with location biasing if current location is available
      String url = 'https://nominatim.openstreetmap.org/search';

      Map<String, dynamic> queryParams = {
        'q': query,
        'format': 'json',
        'addressdetails': '1',
        'limit': '10',
        'countrycodes': 'in', // Restrict search to India only
      };

      // If we have current location, bias the search results towards it
      if (_currentLocation != null) {
        // Create a viewbox around the current location (approximately 50km radius)
        double latDelta = 0.45; // approximately 50km
        double lonDelta = 0.45;

        double north = _currentLocation!.latitude + latDelta;
        double south = _currentLocation!.latitude - latDelta;
        double east = _currentLocation!.longitude + lonDelta;
        double west = _currentLocation!.longitude - lonDelta;

        // viewbox format: <x1>,<y1>,<x2>,<y2> where x is longitude and y is latitude
        // Using viewbox without 'bounded' parameter - this biases results towards the area
        // but doesn't exclude results outside it, allowing better partial name matches
        queryParams['viewbox'] = '$west,$north,$east,$south';
      }

      final response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'User-Agent': 'Propertify/1.0', // Nominatim requires a User-Agent
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        List<Map<String, dynamic>> resultsWithAddresses = [];

        for (var place in data) {
          final lat = double.parse(place['lat'].toString());
          final lon = double.parse(place['lon'].toString());

          // Build address from Nominatim response
          String address = place['display_name'] ?? 'Unknown address';

          resultsWithAddresses.add({
            'location': Location(
              latitude: lat,
              longitude: lon,
              timestamp: DateTime.now(),
            ),
            'address': address,
          });
        }

        setState(() {
          _searchResults = resultsWithAddresses;
          _isSearching = false;
        });
      } else {
        setState(() {
          _searchResults = [];
          _isSearching = false;
        });
      }
    } catch (e) {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
      print('Error searching location: $e');
    }
  }

  void _selectSearchResult(Map<String, dynamic> result) async {
    final Location location = result['location'] as Location;
    final selectedLatLng = LatLng(location.latitude, location.longitude);

    setState(() {
      _selectedLocation = selectedLatLng;
      _showSearchResults = false;
      _searchController.clear();
    });

    // Move camera to selected location
    _mapController.move(selectedLatLng, 15.0);

    // Get address for selected location
    await _getAddressFromLatLng(selectedLatLng);
  }

  void _onMapTap(TapPosition tapPosition, LatLng latLng) {
    setState(() {
      _selectedLocation = latLng;
      _showSearchResults = false;
    });

    // Move camera to tapped location
    _mapController.move(latLng, _mapController.camera.zoom);

    // Get address for selected location
    _getAddressFromLatLng(latLng);
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text(
          'This app needs location permission to show your current location on the map. Please enable location permission in settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _confirmLocation() {
    if (_selectedLocation != null && _selectedAddress.isNotEmpty) {
      Navigator.pop(context, {
        'address': _selectedAddress,
        'city': _selectedCity,
        'state': _selectedState,
        'village': _selectedVillage,
        'lat': _selectedLocation!.latitude.toString(),
        'long': _selectedLocation!.longitude.toString(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Location',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(
                children: [
                  // Map
                  FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter:
                          _currentLocation ??
                          const LatLng(
                            17.3850,
                            78.4867,
                          ), // Default to Hyderabad
                      initialZoom: 15.0,
                      onTap: _onMapTap,
                      onMapReady: () {
                        _getCurrentLocation();
                      },
                    ),

                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.propertify',
                      ),
                      MarkerLayer(
                        markers: [
                          // Current location marker (if different from selected)
                          if (_currentLocation != null &&
                              _selectedLocation != _currentLocation)
                            Marker(
                              point: _currentLocation!,
                              width: 40,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.my_location,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                              ),
                            ),
                          // Selected location marker
                          if (_selectedLocation != null)
                            Marker(
                              point: _selectedLocation!,
                              width: 40,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),

                  // Search bar and Address info card
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Column(
                      children: [
                        // Search bar
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.search, color: Colors.grey),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: const InputDecoration(
                                      hintText: 'Search for a location...',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      // Debounce search - reduced to 300ms for faster response
                                      Future.delayed(
                                        const Duration(milliseconds: 300),
                                        () {
                                          if (_searchController.text == value) {
                                            _searchLocation(value);
                                          }
                                        },
                                      );
                                    },
                                    onTap: () {
                                      setState(() {
                                        _showSearchResults = true;
                                      });
                                    },
                                  ),
                                ),
                                if (_searchController.text.isNotEmpty)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      _searchController.clear();
                                      setState(() {
                                        _searchResults = [];
                                        _showSearchResults = false;
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),

                        // Search results
                        if (_showSearchResults)
                          Card(
                            margin: const EdgeInsets.only(top: 8),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(maxHeight: 200),
                              child: _isSearching
                                  ? const Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : _searchResults.isEmpty
                                  ? const Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Center(
                                        child: Text(
                                          'No results found',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    )
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: _searchResults.length,
                                      separatorBuilder: (context, index) =>
                                          const Divider(height: 1),
                                      itemBuilder: (context, index) {
                                        final result = _searchResults[index];
                                        final address =
                                            result['address'] as String;
                                        return ListTile(
                                          leading: const Icon(
                                            Icons.location_on,
                                            color: Colors.red,
                                          ),
                                          title: Text(
                                            address,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          onTap: () {
                                            _selectSearchResult(result);
                                          },
                                        );
                                      },
                                    ),
                            ),
                          ),

                        // Address card
                        if (!_showSearchResults)
                          Card(
                            margin: const EdgeInsets.only(top: 8),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Selected Location',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  if (_isGeocodingLoading)
                                    const Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text('Getting address...'),
                                      ],
                                    )
                                  else
                                    Text(
                                      _selectedAddress.isEmpty
                                          ? 'Tap on map to select location'
                                          : _selectedAddress,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Current location button
                  Positioned(
                    bottom: 120,
                    right: 16,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_currentLocation != null) {
                          _mapController.move(_currentLocation!, 15.0);
                          setState(() {
                            _selectedLocation = _currentLocation;
                          });
                          _getAddressFromLatLng(_currentLocation!);
                        }
                      },
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.my_location,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),

                  // Confirm button
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: CommonCustomButton(
                      onTap:
                          _selectedLocation != null &&
                              _selectedAddress.isNotEmpty
                          ? _confirmLocation
                          : () {},
                      buttonLabel: 'Confirm Location',
                      isEnable:
                          _selectedLocation != null &&
                          _selectedAddress.isNotEmpty,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
