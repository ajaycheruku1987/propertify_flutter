import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/create_post_bloc.dart';

class ContactPreferencesWidget extends StatelessWidget {
  const ContactPreferencesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Preferences',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'How would you like buyers/tenants to reach you?',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  CheckboxListTile(
                    activeColor: primaryColor,
                    secondary: Icon(
                      Icons.phone_in_talk_rounded,
                      color: primaryColor,
                      size: 22,
                    ),
                    title: const Text(
                      'Phone Call',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      'Allow direct phone calls on your registered mobile number',
                      style: TextStyle(fontSize: 11),
                    ),
                    value: state.contactViaPhone,
                    onChanged: (val) {
                      context.read<CreatePostBloc>().add(
                            CreatePostEvent.contactViaPhoneChanged(
                              contactViaPhone: val ?? true,
                            ),
                          );
                    },
                  ),
                  Divider(height: 1, color: Colors.grey.shade300),
                  CheckboxListTile(
                    activeColor: const Color(0xFF25D366),
                    secondary: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Color(0xFF25D366),
                      size: 22,
                    ),
                    title: const Text(
                      'WhatsApp Message',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      'Allow buyers to message you directly on WhatsApp',
                      style: TextStyle(fontSize: 11),
                    ),
                    value: state.contactViaWhatsApp,
                    onChanged: (val) {
                      context.read<CreatePostBloc>().add(
                            CreatePostEvent.contactViaWhatsAppChanged(
                              contactViaWhatsApp: val ?? true,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
