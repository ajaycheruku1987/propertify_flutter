import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CommonDropdownFormField<T> extends StatelessWidget {
  const CommonDropdownFormField({
    super.key,
    this.label,
    this.isRequired = false,
    this.labelStyle,
    this.borderColor,
    this.fillColor,
    this.padding,
    this.readOnly = false,
    this.hintText,
    this.errorMaxLines = 1,
    this.iconSize = 20,
    this.visualDensity,
    this.menuRadius,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
  });

  final String? label;
  final bool isRequired;
  final TextStyle? labelStyle;
  final Color? borderColor;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final bool readOnly;
  final String? hintText;
  final int errorMaxLines;
  final double iconSize;
  final VisualDensity? visualDensity;
  final double? menuRadius;

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle resolvedHintStyle = readOnly
        ? TextStyle(color: theme.hintColor.withOpacity(0.8))
        : TextStyle(color: Colors.grey.shade500, fontSize: 14);
    final TextStyle resolvedTextStyle = TextStyle(
      color: readOnly ? theme.hintColor.withOpacity(0.8) : Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    label!,
                    style: labelStyle ?? const TextStyle(fontSize: 12),
                  ),
                  if (isRequired)
                    const Text(
                      '*',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        LayoutBuilder(
          builder: (context, constraints) {
            return DropdownButtonFormField2<T>(
              value: value,
              items: items,
              onChanged: readOnly ? null : onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: resolvedTextStyle,
              isExpanded: true,
              validator:
                  validator ??
                  (val) {
                    if (isRequired && val == null) return 'Required';
                    return null;
                  },
              hint: Text(hintText ?? 'Select', style: resolvedHintStyle),
              decoration: InputDecoration(
                isDense: true,
                // visualDensity:
                //     visualDensity ??
                //     const VisualDensity(vertical: -2, horizontal: -2),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                alignLabelWithHint: true,
                floatingLabelStyle: TextStyle(color: theme.primaryColor),
                labelStyle:
                    labelStyle ??
                    TextStyle(color: theme.hintColor.withOpacity(0.4)),
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    padding ??
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                filled: true,
                fillColor: readOnly
                    ? Colors.grey.shade50
                    : (fillColor ?? Colors.white),
                errorMaxLines: errorMaxLines,
                errorStyle: const TextStyle(fontWeight: FontWeight.bold),

                /// Disabled Border
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: borderColor ?? Colors.grey.shade300,
                  ),
                ),

                /// Focused Border
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: borderColor ?? const Color(0xFF7B68EE),
                  ),
                ),

                /// Enabled Border
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: borderColor ?? Colors.grey.shade300,
                  ),
                ),

                /// Error Border
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red, width: 1.5),
                ),

                /// Focused Error Border
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(width: 1.5, color: Colors.red),
                ),
              ),
              iconStyleData: IconStyleData(iconSize: iconSize),
              dropdownStyleData: DropdownStyleData(
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(menuRadius ?? 10.0),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
