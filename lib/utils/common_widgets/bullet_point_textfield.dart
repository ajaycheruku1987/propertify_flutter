import 'package:flutter/material.dart';

class BulletPointTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isRequired;
  final int maxLines;
  final String? hint;

  const BulletPointTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.isRequired = false,
    this.maxLines = 6,
    this.hint,
  }) : super(key: key);

  @override
  State<BulletPointTextField> createState() => _BulletPointTextFieldState();
}

class _BulletPointTextFieldState extends State<BulletPointTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    final text = widget.controller.text;

    // Check if user just pressed enter (newline added)
    if (text.isNotEmpty && text.endsWith('\n')) {
      // Get the current line
      final lines = text.split('\n');
      final currentLineIndex =
          lines.length - 2; // -2 because we just added a newline

      if (currentLineIndex >= 0 && currentLineIndex < lines.length) {
        final currentLine = lines[currentLineIndex];

        // Check if the previous line starts with a bullet
        if (currentLine.trim().startsWith('•')) {
          // Add bullet to the new line
          final newText = text + '• ';
          widget.controller.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length),
          );
        }
      }
    }
  }

  void _addBullet() {
    final text = widget.controller.text;
    final selection = widget.controller.selection;

    String newText;
    int newOffset;

    if (text.isEmpty) {
      // If empty, just add a bullet
      newText = '• ';
      newOffset = newText.length;
    } else {
      // Insert bullet at cursor position or at the start of current line
      final beforeCursor = text.substring(0, selection.start);
      final afterCursor = text.substring(selection.start);

      // Check if we're at the start of a line
      final isAtLineStart = beforeCursor.isEmpty || beforeCursor.endsWith('\n');

      if (isAtLineStart) {
        newText = beforeCursor + '• ' + afterCursor;
        newOffset = beforeCursor.length + 2;
      } else {
        // Go to next line and add bullet
        newText = beforeCursor + '\n• ' + afterCursor;
        newOffset = beforeCursor.length + 3;
      }
    }

    widget.controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newOffset),
    );
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
            // Bullet button
            TextButton.icon(
              onPressed: _addBullet,
              icon: const Icon(Icons.circle, size: 8),
              label: const Text('Add Bullet'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText:
                widget.hint ??
                'Enter ${widget.label.toLowerCase()}...\nTap "Add Bullet" or press Enter after a bullet point',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
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
            contentPadding: const EdgeInsets.all(16),
          ),
          style: const TextStyle(fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 4),
        Text(
          'Tip: Press Enter after a bullet to automatically add the next bullet',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
