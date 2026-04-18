import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/utils/common_widgets/common_custom_button.dart';
import '../../bloc/create_post_bloc.dart';

class LookingForSelector extends StatelessWidget {
  const LookingForSelector({super.key});

  final List<String> options = const ['Sell', 'Rent'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostBloc, CreatePostState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Looking For',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: options.map((option) {
                final isSelected = state.selectedLookingFor == option;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CommonCustomButton(
                      onTap: () {
                        context.read<CreatePostBloc>().add(
                          CreatePostEvent.lookingForChanged(lookingFor: option),
                        );
                      },
                      buttonLabel: option,
                      labelColor: isSelected
                          ? Colors.white
                          : Theme.of(context).hintColor,
                      buttonColor: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      borderColor: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
