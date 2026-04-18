import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propertify/utils/common_widgets/common_textfield.dart';
import '../../bloc/create_post_bloc.dart';

class TitleInput extends StatefulWidget {
  const TitleInput({super.key});

  @override
  State<TitleInput> createState() => _TitleInputState();
}

class _TitleInputState extends State<TitleInput> {
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
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (_controller.text != state.title) {
          _controller.text = state.title;
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFormField(
            controller: _controller,
            keyboardType: TextInputType.text,
            label: 'Title *',
            hintText: 'Enter property title',
            maxLength: 30,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Title is required';
              }
              return null;
            },
            onChanged: (value) {
              context.read<CreatePostBloc>().add(
                CreatePostEvent.titleChanged(title: value),
              );
            },
          ),
        ],
      ),
    );
  }
}
