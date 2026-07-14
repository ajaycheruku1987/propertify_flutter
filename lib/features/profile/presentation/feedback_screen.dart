import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/features/profile/bloc/profile_bloc.dart';
import 'package:propertify/features/profile/models/feedback_model.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';

import '../../../utils/custom_toast.dart';


class FeedbackScreen extends StatefulWidget {
  static const String routeName = '/feedback';
  final FeedbackModel? feedback;

  const FeedbackScreen({super.key, this.feedback});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _subjectController;
  late final TextEditingController _descriptionController;
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _subjectController = TextEditingController(text: widget.feedback?.subject ?? '');
    _descriptionController = TextEditingController(text: widget.feedback?.description ?? '');
    _selectedCategory = widget.feedback?.category ?? 'Suggestion';
  }

  final List<String> _categories = ['Suggestion', 'Feedback', 'Bug'];

  @override
  void dispose() {
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      if (widget.feedback != null) {
        context.read<ProfileBloc>().add(
              ProfileEvent.updateFeedback(
                id: widget.feedback!.id,
                category: _selectedCategory,
                subject: _subjectController.text.trim(),
                description: _descriptionController.text.trim(),
              ),
            );
      } else {
        context.read<ProfileBloc>().add(
              ProfileEvent.submitFeedback(
                category: _selectedCategory,
                subject: _subjectController.text.trim(),
                description: _descriptionController.text.trim(),
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.feedback != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Feedback' : 'Suggestions & Feedback'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listenWhen: (previous, current) =>
            previous.notifyStatus != current.notifyStatus,
        listener: (context, state) {
          if (state.notifyStatus?.message == 'Feedback submitted successfully' ||
              state.notifyStatus?.message == 'Feedback updated successfully') {
            final msg = state.notifyStatus!.message;
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            // Show toast after pop to avoid navigator conflicts
            CustomToast.showSuccessToast(msg: msg);
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Subject',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    hintText: 'Enter subject',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a subject';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Describe your suggestion, feedback, or bug',
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CommonCustomButton(
                        isEnable: !state.isLoading,
                        onTap: _submitFeedback,
                        buttonLabel: state.isLoading ? 'Submitting...' : 'Submit Feedback',
                        buttonColor: Theme.of(context).primaryColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
