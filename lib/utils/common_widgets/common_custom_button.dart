import 'package:flutter/material.dart';

class CommonCustomButton extends StatelessWidget {
  final String? buttonLabel;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? labelColor;
  final bool isEnable;
  final GestureTapCallback onTap;
  final Widget? buttonChild;

  const CommonCustomButton({
    super.key,
    this.buttonLabel,
    this.buttonColor,
    this.borderColor,
    this.labelColor,
    this.isEnable = true,
    this.buttonChild,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isEnable ? onTap : null,
      style: ButtonStyle(
        shape: WidgetStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: borderColor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => isEnable
              ? (buttonColor ?? Theme.of(context).primaryColor)
              : Theme.of(context).disabledColor,
        ),
      ),
      child:
          buttonChild ??
          Text(
            buttonLabel ?? '',
            style: TextStyle(color: labelColor ?? Colors.white),
          ),
    );
  }
}
