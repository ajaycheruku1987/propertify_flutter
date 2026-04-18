import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import '../../bloc/create_post_bloc.dart';
import '../map_screen.dart';

class AddressInput extends StatefulWidget {
  final Function(Map<String, dynamic>) onLocationSelected;
  final TextEditingController controller;
  const AddressInput({
    super.key,
    required this.onLocationSelected,
    required this.controller,
  });

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Only dispose if we created the controller locally

    super.dispose();
  }

  Future<void> _openMapScreen() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => const MapScreen()),
    );

    if (result != null) {
      widget.onLocationSelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (widget.controller.text != state.address) {
          widget.controller.text = state.address;
        }
      },
      child: InkWell(
        onTap: _openMapScreen,
        child: Row(
          children: [
            Expanded(
              child: CommonTextFormField(
                label: 'Address',
                controller: widget.controller,
                maxlines: 3,
                isRequired: true,
                readOnly: true,
                suffixIcon: IconButton(
                  onPressed: _openMapScreen,
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Disabled for manual entry
                },
              ),
            ),
            const SizedBox(width: 12),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
