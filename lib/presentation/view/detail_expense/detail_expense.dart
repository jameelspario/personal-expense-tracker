import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/utils/extensions.dart';

import '../../../utils/constants.dart';
import '../../widgets/custom_textbox.dart';

class DetailExpense extends StatefulWidget {
  DetailExpense({this.item, this.callback, super.key});
  final dynamic item;
  final VoidCallback? callback;

  @override
  State<DetailExpense> createState() => _DetailExpenseState();
}

class _DetailExpenseState extends State<DetailExpense> {
  bool editTitle = false;

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
            onTap: widget.callback,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.edit),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.delete_outline_rounded),
            ),
          ),
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.spaceY,
            Text(
              widget.item.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            16.0.spaceY,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${Strings.r}${widget.item.amount}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                16.0.spaceX,
                Text(
                  Constants.formatDateTimeStr("${widget.item.dateTime}"),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            16.0.spaceY,
            Text(
              widget.item.description,
              // style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
