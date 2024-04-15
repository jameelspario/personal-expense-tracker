import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/utils/extensions.dart';

import '../../../utils/constants.dart';
import '../../widgets/custom_textbox.dart';

class EditExpense extends StatefulWidget {
  const EditExpense({this.item, super.key});
  final dynamic item;

  @override
  State<EditExpense> createState() => _EditExpenseState();
}

class _EditExpenseState extends State<EditExpense> {
  static final controllerTitle = TextEditingController();
  static final controllerExpense = TextEditingController();
  static final controllerDesription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(Strings.expense),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete_outline_rounded),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            16.0.spaceY,
            CustomTextbox(
              controller: controllerTitle,
              hint: Strings.title,
              // suffixIcon: IconButton(
              //   icon: Icon(Icons.check),
              //   onPressed: () {
              //     editTitle = !editTitle;
              //     setState(() {});
              //   },
              // ),
            ),
            16.0.spaceY,
            CustomTextbox(
              controller: controllerExpense,
              hint: Strings.expense,
              keyboardType: TextInputType.number,
            ),
            16.0.spaceY,
            CustomTextbox(
              controller: controllerDesription,
              hint: Strings.description,
              minLine: 3,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
    );
  }
}
