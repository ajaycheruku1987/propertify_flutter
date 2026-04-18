import 'package:go_router/go_router.dart';
import 'package:propertify/features/company/presentation/create_company_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:propertify/features/company/bloc/company_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/utils/custom_toast.dart';

class GstVerificationScreen extends StatefulWidget {
  static const String routeName = '/gst-verification';

  const GstVerificationScreen({super.key});

  @override
  State<GstVerificationScreen> createState() => _GstVerificationScreenState();
}

class _GstVerificationScreenState extends State<GstVerificationScreen> {
  final TextEditingController _gstController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Reset bloc state when screen is visited
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CompanyBloc>().add(const CompanyEvent.resetState());
    });
  }

  @override
  void dispose() {
    _gstController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_gstController.text.trim().isEmpty) {
      CustomToast.showErrorToast(msg: 'Please enter GST number');
      return;
    }

    final bloc = context.read<CompanyBloc>();
    bloc.add(CompanyEvent.gstNumberChanged(gstNumber: _gstController.text));
    context.push(CreateCompanyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create company',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<CompanyBloc, CompanyState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              CustomToast.showErrorToast(msg: state.errorMessage!);
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        // Placeholder Illustration
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/city_illustration.svg', // Assuming this asset exists or using placeholder
                              height: 180,
                              placeholderBuilder: (BuildContext context) =>
                                  const Icon(
                                    Icons.business,
                                    size: 100,
                                    color: Colors.indigoAccent,
                                  ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        const Text(
                          'Verify GST for Create Company',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Enter your GST Number and Verify to\nRegister company',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 40),

                        CommonTextFormField(
                          controller: _gstController,
                          hintText: 'GST number',
                          onChanged: (value) {
                            // Optional: Validate format live
                          },
                        ),

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          child: CommonCustomButton(
                            onTap: _onNextPressed,
                            buttonLabel: 'Next',
                            isEnable: !state.isLoading,
                            // Matches screenshot purple
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
