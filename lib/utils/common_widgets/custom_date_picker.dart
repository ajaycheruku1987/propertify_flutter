import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/app_theme.dart';

class CustomDatePicker extends StatelessWidget {
  final String? label;
  final String? hintText;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool isRequired;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final Color? borderColor;
  final bool readOnly;
  final IconData? suffixIcon;

  const CustomDatePicker({
    super.key,
    this.label,
    this.hintText,
    this.selectedDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.isRequired = false,
    this.validator,
    this.labelStyle,
    this.borderColor,
    this.readOnly = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
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
                    style: labelStyle ??
                        TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? Colors.white70
                              : Colors.black87,
                        ),
                  ),
                  if (isRequired)
                    Text(
                      ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        GestureDetector(
          onTap: readOnly ? null : () => _showDatePicker(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: borderColor ??
                    (isDarkMode
                        ? AppTheme.borderColorDarkMode
                        : AppTheme.borderColorLightMode),
                width: 1,
              ),
              color: readOnly
                  ? (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade50)
                  : (isDarkMode
                      ? AppTheme.textFieldDarkModeBackGroundColor
                      : AppTheme.textFieldLightModeBackGroundColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate != null
                          ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                          : hintText ?? 'Select Date',
                      style: TextStyle(
                        color: selectedDate != null
                            ? (isDarkMode
                                ? AppTheme.textFieldTextColorDarkMode
                                : AppTheme.textFieldTextColorLightMode)
                            : (isDarkMode
                                ? Colors.grey.shade400
                                : Colors.grey.shade500),
                        fontSize: 14,
                        fontWeight: selectedDate != null
                            ? FontWeight.w500
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                  Icon(
                    suffixIcon ?? Icons.calendar_today,
                    size: 20,
                    color: readOnly
                        ? (isDarkMode ? Colors.grey.shade600 : Colors.grey.shade400)
                        : AppTheme.blueColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: AppTheme.blueColor,
              onPrimary: Colors.white,
              surface: isDarkMode
                  ? AppTheme.backgroundColorDarkTheme
                  : Colors.white,
              onSurface: isDarkMode
                  ? Colors.white
                  : Colors.black,
            ),
            dialogBackgroundColor: isDarkMode
                ? AppTheme.backgroundColorDarkTheme
                : Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.blueColor,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }
}

// Alternative Bottom Sheet Date Picker
class CustomBottomDatePicker {
  static Future<void> show({
    required BuildContext context,
    required Function(DateTime) onDateSelected,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? title,
  }) async {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: isDarkMode
                ? AppTheme.backgroundColorDarkTheme
                : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Title
              if (title != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              
              // Date Picker
              Expanded(
                child: Theme(
                  data: theme.copyWith(
                    colorScheme: theme.colorScheme.copyWith(
                      primary: AppTheme.blueColor,
                      onPrimary: Colors.white,
                      surface: isDarkMode
                          ? AppTheme.backgroundColorDarkTheme
                          : Colors.white,
                      onSurface: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  child: CalendarDatePicker(
                    initialDate: initialDate ?? DateTime.now(),
                    firstDate: firstDate ?? DateTime(1900),
                    lastDate: lastDate ?? DateTime(2100),
                    onDateChanged: (DateTime date) {
                      onDateSelected(date);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}