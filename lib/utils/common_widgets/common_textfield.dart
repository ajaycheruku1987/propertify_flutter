import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    super.key,
    this.controller,
    this.maxlines = 1,
    this.hintText,
    this.label,
    this.readOnly = false,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,
    this.obscureText = false,
    this.errorMaxLines = 1,
    this.onChanged,
    this.inputAction,
    this.hintStyle,
    this.enableBorder = false,
    this.maxLength,
    this.style,
    this.borderColor,
    this.padding,
    this.starIcon,
    this.onTap,
    this.labelStyle,
    this.focusNode,
    this.initialValue,
    this.textInputFormatter,
    this.autoValidate,
    this.onEditingComplete,
    this.isRequired,
  });

  final TextEditingController? controller;
  final int? maxlines;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final Widget? prefixIcon;
  final int errorMaxLines;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final String? label;
  final TextStyle? style;
  final bool? enableBorder;
  final TextInputAction? inputAction;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final Color? borderColor;
  final String? starIcon;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;
  final FocusNode? focusNode;
  final String? initialValue;
  final AutovalidateMode? autoValidate;
  final List<TextInputFormatter>? textInputFormatter;
  final void Function()? onEditingComplete;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Column(
            children: [
              Row(
                children: [
                  Text(label!, style: labelStyle ?? TextStyle(fontSize: 12)),
                  if (isRequired == true)
                    Text(
                      '*',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              ),
              SizedBox(height: 4),
            ],
          ),
        TextFormField(
          onTap: onTap,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxlines,
          onChanged: onChanged,
          controller: controller,
          readOnly: readOnly,
          validator: validator,
          errorBuilder: (context, error) {
            return Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 12),
              maxLines: errorMaxLines,
            );
          },
          enabled: !readOnly,
          obscureText: obscureText,
          obscuringCharacter: "●",
          focusNode: focusNode,
          autovalidateMode: autoValidate ?? AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          contextMenuBuilder: (context, editableTextState) {
            return Theme(
              data:
                  ThemeData.light(), // Change to light or dark based on your need
              child: AdaptiveTextSelectionToolbar.editableText(
                editableTextState: editableTextState,
              ),
            );
          },
          style: TextStyle(
            color: readOnly
                ? Theme.of(context).hintColor.withOpacity(0.8)
                : Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          inputFormatters: textInputFormatter ?? [],
          initialValue: initialValue,
          onTapOutside: (event) {
            if (focusNode != null) {
              FocusScope.of(context).unfocus();
            }
          },
          onEditingComplete: onEditingComplete,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            floatingLabelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            // labelText: label,
            labelStyle:
                labelStyle ??
                TextStyle(color: Theme.of(context).hintColor.withOpacity(0.4)),
            counterText: "",
            prefixIcon: prefixIcon,
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            filled: true,
            fillColor: readOnly ? Colors.grey.shade50 : Colors.white,
            hintStyle: readOnly
                ? TextStyle(color: Theme.of(context).hintColor.withOpacity(0.8))
                : hintStyle ??
                      TextStyle(color: Colors.grey.shade500, fontSize: 14),
            errorMaxLines: errorMaxLines,
            errorStyle: const TextStyle(fontWeight: FontWeight.bold),

            /// Disable Border
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

            /// Enable Border
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
        ),
      ],
    );
  }
}
