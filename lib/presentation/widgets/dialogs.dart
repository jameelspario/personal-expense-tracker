import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/utils/extensions.dart';

import '../../utils/constants.dart';
import 'custom_button.dart';
import 'custom_textbox.dart';

class Dialogs {
  static snackbar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message ?? ""),
    ));
  }

  static Future loadingDialog(BuildContext context) async {
    return showDialog(
        context: context,
        // barrierColor: Colors.transparent,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                24.0.spaceX,
                const Text(Strings.pleaseWait),
              ],
            ),
          );
        });
  }

  static Future confirmDialog(BuildContext context,
      {String message = "", required VoidCallback callback}) async {
    return showDialog(
        context: context,
        builder: (con) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleSmall,),
                24.0.spaceY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                        text: "Cancel", callback: () => Navigator.pop(context)),
                    CustomButton(text: "Confirm", callback: callback),
                  ],
                )
              ]),
            ),
          );
        });
  }

  static Future addNewDialog(BuildContext context,
      {controllerTitle,
      controllerExpense,
      controllerDesription,
      required VoidCallback callback}) async {
    return showDialog(
        context: context,
        builder: (con) {
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            content: Container(),
          );
        });
  }
}
