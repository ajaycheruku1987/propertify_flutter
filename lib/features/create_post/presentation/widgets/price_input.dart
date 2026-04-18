import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propertify/utils/common_widgets/common_textfield.dart';
import '../../bloc/create_post_bloc.dart';

class PriceInput extends StatefulWidget {
  const PriceInput({super.key});

  @override
  State<PriceInput> createState() => _PriceInputState();
}

class _PriceInputState extends State<PriceInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatPrice(String value) {
    if (value.isEmpty) return '';

    // Remove all non-digit characters
    String digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.isEmpty) return '';

    // Convert to number and format with commas
    int number = int.parse(digitsOnly);
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (_controller.text != state.price) {
          _controller.text = state.price;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            label: 'Price *',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Price is required';
              }
              return null;
            },
            onChanged: (value) {
              String formatted = _formatPrice(value);
              String displayValue = formatted.isNotEmpty ? '₹ $formatted' : '';

              // Update cursor position
              int cursorPosition = displayValue.length;
              _controller.value = TextEditingValue(
                text: displayValue,
                selection: TextSelection.collapsed(offset: cursorPosition),
              );

              context.read<CreatePostBloc>().add(
                CreatePostEvent.priceChanged(price: displayValue),
              );
            },
          ),
        ],
      ),
    );
  }
}
