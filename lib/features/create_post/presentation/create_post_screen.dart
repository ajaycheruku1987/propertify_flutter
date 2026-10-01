import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propertify/features/home/presentation/home_screen.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/post_success_screen.dart';
import 'package:propertify/utils/custom_toast.dart';
import 'package:propertify/core/content_type.dart';
import 'package:propertify/l10n/app_localizations.dart';
import '../bloc/create_post_bloc.dart';
import 'create_post_details_screen.dart';
import 'widgets/step_progress_bar.dart';
import 'widgets/title_input.dart';
import 'widgets/category_selector_widget.dart';
import 'widgets/looking_for_selector.dart';
import 'widgets/pricing_section_widget.dart';
import 'widgets/carpet_area_input_widget.dart';
import 'widgets/property_status_widget.dart';
import 'widgets/address_input.dart';
import 'widgets/city_input.dart';
import 'widgets/plot_details_input.dart';

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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.createPost,
          style: const TextStyle(
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
            final postId = state.addPostResponse?.id ?? '';
            context.go(
              '${PostSuccessScreen.routeName}?title=${Uri.encodeComponent(l10n.postedSuccessfully)}&message=${Uri.encodeComponent(l10n.postCreatedSuccess)}&contentType=${ContentType.FEED.value}&contentId=$postId&homeRoute=${Uri.encodeComponent('${HomeScreen.routeName}?refresh=true')}',
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                // Visual Progress Stepper Bar
                const StepProgressBar(currentStep: 0),
                const Divider(height: 1, color: Color(0xFFEEEEEE)),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Section
                        const TitleInput(),

                        const SizedBox(height: 24),

                        // Hierarchical Category & Subcategory Selector
                        const CategorySelectorWidget(),

                        const SizedBox(height: 24),

                        // Looking For Section (Sell / Rent / Lease)
                        const LookingForSelector(),

                        const SizedBox(height: 24),

                        // Pricing Section (Price + Negotiable / Rent + Deposit)
                        const PricingSectionWidget(),

                        const SizedBox(height: 24),

                        // Carpet Area / Built-Up Area Section (For Residential, Commercial, Industrial)
                        const CarpetAreaInputWidget(),

                        // Property Construction Status (Ready to Move, Under Construction, etc.)
                        const PropertyStatusWidget(),

                        // Location & Address Section
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

                            context.read<CreatePostBloc>().add(
                              CreatePostEvent.locationChanged(location: city),
                            );
                          },
                        ),

                        const SizedBox(height: 16),

                        // City Input
                        const CityInput(),

                        const SizedBox(height: 20),

                        // Plot Details Section (Conditional for Open Plot / Land & Sell)
                        const PlotDetailsInput(),

                        const SizedBox(height: 32),

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
                                    msg: l10n.fillAllFields,
                                  );
                                }
                              }
                            },
                            buttonLabel: l10n.next,
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
