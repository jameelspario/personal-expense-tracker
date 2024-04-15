import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ItemExpense extends StatelessWidget {
  const ItemExpense({this.item, this.callback, super.key});
  final dynamic item;
  final VoidCallback? callback; 

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)) 
      ),
      child: ListTile(
        onTap: callback,
        title: Text(
          item.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium,
        ),
        subtitle: Text(item.description),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // GestureDetector(
            //   onTap: (){},
            //   child: Icon(Icons.edit),
            // ),
            Text("${Strings.r}${item.amount}", style: Theme.of(context).textTheme.titleMedium,), 
            Text(Constants.formatDateTimeStr("${item.dateTime}")),
          ],
        ),
      ),
    );
  }
}
