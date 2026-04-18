import 'package:flutter/material.dart';

class DynamicListField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isRequired;
  final String? hint;

  const DynamicListField({
    Key? key,
    required this.label,
    required this.controller,
    this.isRequired = false,
    this.hint,
  }) : super(key: key);

  @override
  State<DynamicListField> createState() => _DynamicListFieldState();
}

class _DynamicListFieldState extends State<DynamicListField> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    final text = widget.controller.text;
    if (text.isEmpty) {
      _controllers = [TextEditingController()];
    } else {
      final items = text.split(';;');
      _controllers = items
          .map((item) => TextEditingController(text: item))
          .toList();
      if (_controllers.isEmpty) {
        _controllers = [TextEditingController()];
      }
    }

    for (var c in _controllers) {
      c.addListener(_updateMainController);
    }
  }

  void _updateMainController() {
    final items = _controllers
        .map((c) => c.text.trim())
        .where((text) => text.isNotEmpty)
        .toList();
    widget.controller.text = items.join(';;');
  }

  void _addField() {
    setState(() {
      final newController = TextEditingController();
      newController.addListener(_updateMainController);
      _controllers.add(newController);
    });
  }

  void _removeField(int index) {
    setState(() {
      final controller = _controllers.removeAt(index);
      controller.removeListener(_updateMainController);
      controller.dispose();
      _updateMainController();
    });
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.removeListener(_updateMainController);
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            if (widget.isRequired)
              const Text(
                ' *',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            const Spacer(),
            TextButton.icon(
              onPressed: _addField,
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _controllers.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controllers[index],
                    decoration: InputDecoration(
                      hintText:
                          widget.hint ??
                          'Enter ${widget.label.toLowerCase()}...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                if (_controllers.length > 1)
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                    onPressed: () => _removeField(index),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
