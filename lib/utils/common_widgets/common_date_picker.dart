import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screen_config.dart';

selectDate({
  String? initialDate,
  bool isDOB = false,
  DateTime? minDate,
  DateTime? maxDate,
  String? pickerTitle,
  required BuildContext context,
  required Function(String) onSubmit,
}) async {
  BottomPicker.date(
    dateOrder: DatePickerDateOrder.dmy,
    pickerTitle: pickerTitle != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pickerTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: getFontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : null,
    initialDateTime: initialDate != null
        ? DateTime.tryParse(initialDate)
        : (isDOB ? DateTime(DateTime.now().year - 18, 1) : DateTime.now()),
    maxDateTime: maxDate ?? DateTime(DateTime.now().year - 18, 12),
    minDateTime: minDate ?? DateTime(DateTime.now().year - 60, 12, 1),
    displayCloseIcon: false,
    pickerTextStyle: TextStyle(
      color: Theme.of(context).hintColor,
      fontWeight: FontWeight.bold,
      fontSize: getFontSize(26),
    ),
    onSubmit: (index) {
      print(index);
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      onSubmit(formatter.format(index));
    },
    dismissable: true,
    backgroundColor: Theme.of(context).dialogBackgroundColor,
    bottomPickerTheme: BottomPickerTheme.morningSalad,
    buttonStyle: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
    ),
  ).show(context);
}
