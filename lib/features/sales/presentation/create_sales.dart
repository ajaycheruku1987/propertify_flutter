import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:propertify/l10n/app_localizations.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/utils/common_widgets/common_dropdown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/create_post/bloc/create_post_bloc.dart';
import 'package:propertify/features/create_post/presentation/widgets/address_input.dart';
import 'package:propertify/features/create_post/presentation/widgets/property_type_selector.dart';
import 'package:propertify/features/sales/bloc/sales_bloc.dart';
import 'package:propertify/features/sales/models/create_sales_data_model.dart';
import 'package:propertify/features/sales/presentation/create_sales_media.dart';
import 'package:propertify/utils/common_widgets/dynamic_list_field.dart';

class CreateSalesScreen extends StatefulWidget {
  static const String routeName = '/create-sales';

  const CreateSalesScreen({super.key});

  @override
  State<CreateSalesScreen> createState() => _CreateSalesScreenState();
}

class _CreateSalesScreenState extends State<CreateSalesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _reraController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _noOfFloorsController = TextEditingController();
  final TextEditingController _noOfUnitsController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _publicFacilitiesController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _specController = TextEditingController();
  final TextEditingController _saleSpecificationController =
      TextEditingController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  final TextEditingController _possessionDateController =
      TextEditingController();

  String _selectedAreaUnit = 'SqFts';

  double? _selectedLatitude;
  double? _selectedLongitude;
  String? _selectedCity;
  String? _selectedAddress;

  @override
  void initState() {
    super.initState();
    _selectedAreaUnit = 'SqFts';
  }

  @override
  void dispose() {
    _projectNameController.dispose();
    _reraController.dispose();
    _areaController.dispose();
    _noOfFloorsController.dispose();
    _noOfUnitsController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _publicFacilitiesController.dispose();
    _descriptionController.dispose();
    _specController.dispose();
    _saleSpecificationController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _possessionDateController.dispose();
    super.dispose();
  }

  Future<void> _selectPossessionDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _possessionDateController.text = DateFormat(
          'dd-MM-yyyy',
        ).format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.createSalesProject,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<SalesBloc, SalesState>(
        listener: (context, state) {
          final msg = state.notifyStatus?.message;
          if (msg != null && msg.isNotEmpty) {}
          // if (state.isSuccess && !state.isLoading) {
          //   context.pop();
          // }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextFormField(
                  label: l10n.projectName,
                  controller: _projectNameController,
                  isRequired: true,
                  maxLength: 30,
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? l10n.required : null,
                ),
                const SizedBox(height: 16),
                CommonTextFormField(
                  label: l10n.reraNumber,
                  controller: _reraController,
                  isRequired: true,
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? l10n.required : null,
                ),
                const SizedBox(height: 16),
                const PropertyTypeSelector(),
                const SizedBox(height: 16),
                // Dynamic fields based on Property Type selection
                BlocBuilder<CreatePostBloc, CreatePostState>(
                  builder: (context, state) {
                    final type = state.selectedPropertyType
                        .toLowerCase()
                        .trim();

                    String unitsLabel = l10n.noOfUnits;
                    String areaLabel = l10n.totalBuiltUpArea;
                    bool showFloors = false;

                    if (type == 'apartment' || type == 'apartments') {
                      unitsLabel = l10n.noOfFlats;
                      showFloors = true;
                    } else if (type == 'villa' || type == 'villas') {
                      unitsLabel = l10n.noOfVillas;
                    } else if (type == 'open plot' ||
                        type == 'plots' ||
                        type == 'properties') {
                      unitsLabel = l10n.noOfPlots;
                      areaLabel = l10n.totalProjectArea;
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showFloors) ...[
                          CommonDropdownFormField<int>(
                            label: l10n.noOfFloors,
                            isRequired: true,
                            value: _noOfFloorsController.text.isEmpty
                                ? null
                                : int.tryParse(_noOfFloorsController.text),
                            items: List.generate(
                              50,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text('${index + 1}'),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _noOfFloorsController.text =
                                    val?.toString() ?? '';
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                        CommonTextFormField(
                          label: unitsLabel,
                          controller: _noOfUnitsController,
                          keyboardType: TextInputType.number,
                          isRequired: true,
                          validator: (v) =>
                              v == null || v.trim().isEmpty ? l10n.required : null,
                        ),
                        const SizedBox(height: 16),
                        CommonTextFormField(
                          label: areaLabel,
                          controller: _areaController,
                          keyboardType: TextInputType.number,
                          isRequired: true,
                          validator: (v) =>
                              v == null || v.trim().isEmpty ? l10n.required : null,
                        ),
                        const SizedBox(height: 16),
                        CommonDropdownFormField<String>(
                          label: l10n.measurement,
                          isRequired: true,
                          value: _selectedAreaUnit,
                          items: const [
                            DropdownMenuItem(
                              value: 'SqFts',
                              child: Text('SqFts'),
                            ),
                            DropdownMenuItem(
                              value: 'SqYards',
                              child: Text('SqYards'),
                            ),
                            DropdownMenuItem(
                              value: 'Acres',
                              child: Text('Acres'),
                            ),
                          ],
                          onChanged: (val) {
                            setState(() {
                              _selectedAreaUnit = val ?? 'SqFts';
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CommonTextFormField(
                        label: l10n.minPrice,
                        controller: _minPriceController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        isRequired: true,
                        validator: (v) =>
                            v == null || v.trim().isEmpty ? l10n.required : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CommonTextFormField(
                        label: l10n.maxPrice,
                        controller: _maxPriceController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        isRequired: true,
                        validator: (v) =>
                            v == null || v.trim().isEmpty ? l10n.required : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CommonTextFormField(
                  label: l10n.saleSpecification,
                  controller: _saleSpecificationController,
                  hintText: l10n.saleSpecHint,
                  maxlines: 2,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: _selectPossessionDate,
                  child: AbsorbPointer(
                    child: CommonTextFormField(
                      label: l10n.possessionDate,
                      controller: _possessionDateController,
                      suffixIcon: const Icon(Icons.calendar_month),
                      hintText: l10n.selectPossessionDate,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Address (reused from Create Post)
                AddressInput(
                  controller: _addressController,
                  onLocationSelected: (locationData) {
                    final address = locationData['address'] as String;
                    final city = locationData['city'] as String;
                    final village = locationData['village'] as String;
                    final stateVal = locationData['state'] as String;
                    final latitude = double.parse(
                      locationData['lat'] as String,
                    );
                    final longitude = double.parse(
                      locationData['long'] as String,
                    );

                    // Store locally for sales creation
                    _selectedAddress = address;
                    _addressController.text = address;
                    _selectedCity = '$village, $city';
                    _cityController.text = _selectedCity ?? city;
                    _stateController.text = stateVal;
                    _selectedLatitude = latitude;
                    _selectedLongitude = longitude;

                    context.read<CreatePostBloc>().add(
                      CreatePostEvent.locationCoordinatesChanged(
                        address: address,
                        latitude: latitude,
                        longitude: longitude,
                      ),
                    );
                    context.read<CreatePostBloc>().add(
                      CreatePostEvent.locationChanged(
                        location: '$city, $village',
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CommonTextFormField(
                        label: l10n.city,
                        controller: _cityController,
                        readOnly: true,
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.pleaseChooseAddress;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CommonTextFormField(
                        label: l10n.state,
                        controller: _stateController,
                        readOnly: true,
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return l10n.pleaseChooseAddress;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Removed explicit Location/Latitude/Longitude inputs
                const SizedBox(height: 16),
                // Description
                CommonTextFormField(
                  label: l10n.description,
                  controller: _descriptionController,
                  maxlines: 6,
                ),
                const SizedBox(height: 16),
                // Specifications with bullet points
                DynamicListField(
                  label: l10n.specifications,
                  controller: _specController,
                  hint: l10n.enterSpecification,
                ),
                const SizedBox(height: 16),
                // Public Facilities with bullet points
                DynamicListField(
                  label: l10n.publicFacilities,
                  controller: _publicFacilitiesController,
                  hint: l10n.enterPublicFacility,
                ),

                const SizedBox(height: 24),
                SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    child: CommonCustomButton(
                      buttonLabel: l10n.next,
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final createPostState = context
                              .read<CreatePostBloc>()
                              .state;

                          // Map property type to backend format
                          String propertyType = createPostState
                              .selectedPropertyType
                              .toLowerCase()
                              .trim();
                          if (propertyType == 'apartments') {
                            propertyType = 'Apartments';
                          } else if (propertyType == 'villas') {
                            propertyType = 'Villas';
                          } else if (propertyType == 'open plot' ||
                              propertyType == 'plots' ||
                              propertyType == 'properties') {
                            propertyType = 'OpenPlot';
                          }

                          final String projectName = _projectNameController.text
                              .trim();
                          final String? rera =
                              _reraController.text.trim().isEmpty
                              ? null
                              : _reraController.text.trim();
                          final num area =
                              num.tryParse(_areaController.text.trim()) ?? 0;
                          final String areaUnit = _selectedAreaUnit
                              .toLowerCase();
                          final int? noOfUnits =
                              _noOfUnitsController.text.trim().isEmpty
                              ? null
                              : int.tryParse(_noOfUnitsController.text.trim());
                          final int? noOfFloors =
                              _noOfFloorsController.text.trim().isEmpty
                              ? null
                              : int.tryParse(_noOfFloorsController.text.trim());
                          final String? address =
                              (_selectedAddress ??
                                      _addressController.text.trim())
                                  .isEmpty
                              ? null
                              : (_selectedAddress ??
                                    _addressController.text.trim());
                          final String? city =
                              (_selectedCity ??
                                      createPostState.selectedLocation)
                                  .isEmpty
                              ? null
                              : (_selectedCity ??
                                    createPostState.selectedLocation);
                          final String? state =
                              _stateController.text.trim().isEmpty
                              ? null
                              : _stateController.text.trim();
                          final double? latitude =
                              _selectedLatitude ?? createPostState.latitude;
                          final double? longitude =
                              _selectedLongitude ?? createPostState.longitude;
                          final String? publicFacilities =
                              _publicFacilitiesController.text.trim().isEmpty
                              ? null
                              : _publicFacilitiesController.text.trim();
                          final String? description =
                              _descriptionController.text.trim().isEmpty
                              ? null
                              : _descriptionController.text.trim();
                          final String? specifications =
                              _specController.text.trim().isEmpty
                              ? null
                              : _specController.text.trim();

                          final num? minPrice = num.tryParse(
                            _minPriceController.text.trim(),
                          );
                          final num? maxPrice = num.tryParse(
                            _maxPriceController.text.trim(),
                          );

                          final String? possessionDate =
                              _possessionDateController.text.trim().isEmpty
                              ? null
                              : _possessionDateController.text.trim();

                          final String? saleSpecification =
                              _saleSpecificationController.text.trim().isEmpty
                              ? null
                              : _saleSpecificationController.text.trim();

                          final draft = CreateSalesDataModel(
                            propertyType: propertyType,
                            projectName: projectName,
                            rera: rera,
                            area: area,
                            areaUnit: areaUnit,
                            noOfUnits: noOfUnits,
                            noOfFloors: noOfFloors,
                            address: address,
                            city: city,
                            state: state,
                            latitude: latitude,
                            longitude: longitude,
                            publicFacilities: publicFacilities,
                            minPrice: minPrice,
                            maxPrice: maxPrice,
                            possessionDate: possessionDate,
                            description: description,
                            specifications: specifications,
                            saleSpecification: saleSpecification,
                            location: createPostState.selectedLocation,
                          );
                          context.read<SalesBloc>().add(
                            SalesEvent.updateSalesDetails(
                              createSalesDataModel: draft,
                            ),
                          );
                          context.push(
                            SalesProjectImagesDescriptionScreen.routeName,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
