import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

commonShowBottomModelSheet({
  required BuildContext context,
  required Widget dialogWidget,
  BoxConstraints? constraints,
  bool? isDismissible,
  bool? isScrollControlled,
  bool? enableDrag,
  Function(dynamic)? thenFun,
}) async {
  await showModalBottomSheet(
    context: context,
    constraints: constraints,
    isScrollControlled: isScrollControlled ?? true,
    isDismissible: isDismissible ?? true,
    enableDrag: enableDrag ?? true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r))),
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Container(
            padding: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25))),
            child: dialogWidget),
      ),
    ),
  ).then((value) {
    if (thenFun != null) {
      thenFun(value);
    }
  });
}
