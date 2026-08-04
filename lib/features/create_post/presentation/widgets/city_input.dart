import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify/utils/common_widgets/common_textfield.dart';
import 'package:propertify/l10n/app_localizations.dart';
import '../../bloc/create_post_bloc.dart';

class CityInput extends StatefulWidget {
  const CityInput({super.key});

  @override
  State<CityInput> createState() => _CityInputState();
}

class _CityInputState extends State<CityInput> {
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (_controller.text != state.selectedLocation) {
          _controller.text = state.selectedLocation;
        }
      },
      child: CommonTextFormField(
        label: l10n.city,
        controller: _controller,
        readOnly: true,
        onChanged: (value) {
          // Disabled for manual entry - city updates from map selection
        },
      ),
    );
  }
}