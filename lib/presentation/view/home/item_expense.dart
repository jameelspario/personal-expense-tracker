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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
            Text("${Strings.r}${item.amount}", style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
            Align( 
              alignment: Alignment.bottomRight,
              child: Text(Constants.formatDateTimeStr("${item.dateTime}"), style: Theme.of(context).textTheme.labelSmall,)),
          ],
        ),
        // trailing: ,
      ),
    );
  }
}
