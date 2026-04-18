import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/presentation/home_screen.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/post_success_screen.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/core/content_type.dart';
import '../bloc/create_post_bloc.dart';
import '../../../core/service_locator.dart';
import 'create_post_details_screen.dart';
import 'widgets/title_input.dart';
import 'widgets/property_type_selector.dart';
import 'widgets/looking_for_selector.dart';
import 'widgets/address_input.dart';
import 'widgets/city_input.dart';
import 'widgets/price_input.dart';

class CreatePostScreen extends StatefulWidget {
  static const String routeName = '/create-post';

  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Reset bloc state when screen is visited
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CreatePostBloc>().add(const CreatePostEvent.resetState());
    });
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
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
          'Create Post',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CreatePostBloc, CreatePostState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            CustomToast.showErrorToast(msg: state.errorMessage!);
          }
          if (state.addPostResponse != null) {
            // Navigate to success screen using GoRouter
            final postId = state.addPostResponse?.id ?? '';
            context.go(
              '${PostSuccessScreen.routeName}?title=${Uri.encodeComponent('Posted Successfully!')}&message=${Uri.encodeComponent('Your Post has been created Successfully\nwould You Like to boost Your Post')}&contentType=${ContentType.FEED.value}&contentId=$postId&homeRoute=${Uri.encodeComponent('${HomeScreen.routeName}?refresh=true')}',
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Section
                  const TitleInput(),

                  const SizedBox(height: 24),

                  // Property Type Section
                  const PropertyTypeSelector(),

                  const SizedBox(height: 24),

                  // Looking For Section
                  const LookingForSelector(),

                  const SizedBox(height: 24),

                  // Address Section
                  AddressInput(
                    controller: _addressController,
                    onLocationSelected: (locationData) {
                      final address = locationData['address'] as String;
                      final city =
                          '${locationData['village']}, ${locationData['city']}';
                      final latitude = double.parse(
                        locationData['lat'] as String,
                      );
                      final longitude = double.parse(
                        locationData['long'] as String,
                      );

                      context.read<CreatePostBloc>().add(
                        CreatePostEvent.locationCoordinatesChanged(
                          address: address,
                          latitude: latitude,
                          longitude: longitude,
                        ),
                      );

                      // Update city/location
                      context.read<CreatePostBloc>().add(
                        CreatePostEvent.locationChanged(location: city),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // City Input
                  const CityInput(),

                  const SizedBox(height: 24),

                  // Price Section
                  const PriceInput(),

                  const SizedBox(height: 40),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: CommonCustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (state.isValid) {
                            context.push(
                              CreatePostImagesDescriptionScreen.routeName,
                            );
                          } else {
                            CustomToast.showErrorToast(
                              msg: 'Please fill all the fields',
                            );
                          }
                        }
                      },
                      buttonLabel: 'Next',
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
