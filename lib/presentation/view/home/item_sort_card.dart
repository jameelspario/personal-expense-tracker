import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  const ItemCard(
      {this.index = 0,
      this.selected = -1,
      this.title = '',
      this.value = '0',
      super.key});
  final int index;
  final int selected;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected == index ? Colors.black : null,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          children: [
            Text(
              "$value",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: selected == index ? Colors.white : null),
            ),
            Text(
              "$title",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: selected == index ? Colors.white54 : null),
            ),
          ],
        ),
      ),
    );
  }
}