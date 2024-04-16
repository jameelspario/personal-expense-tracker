import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/presentation/cubit/home/home_cubit.dart';

import 'item_sort_card.dart';

/* 

sort item by clicking item :-
when Today is selected all expenses for current day will be shown
when this Week is selected all expenses for the week will be shown
when this Month is selected all expenses for the month will be shown
when Nothing is slelected all expenses will be shown without filter

 */

class ItemSortCard extends StatefulWidget {
  const ItemSortCard({super.key});

  @override
  State<ItemSortCard> createState() => _ItemSortCardState();
}

class _ItemSortCardState extends State<ItemSortCard> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HomeCubit>();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    selected = selected == 0 ? -1 : 0;
                    setState(() {});
                    bloc.retrieveSort(selected);
                  },
                  child: ItemCard(
                    index: 0,
                    selected: selected,
                    title: "Today",
                    value: "${bloc.today}",
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      selected = selected == 1 ? -1 : 1;
                      setState(() {});
                      bloc.retrieveSort(selected);
                    },
                    child: ItemCard(
                      index: 1,
                      selected: selected,
                      title: "This Week",
                      value: "${bloc.week}",
                    )),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      selected = selected == 2 ? -1 : 2;
                      setState(() {});
                      bloc.retrieveSort(selected);
                    },
                    child: ItemCard(
                      index: 2,
                      selected: selected,
                      title: "This Month",
                      value: "${bloc.month}",
                    )),
              ),
            ],
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   child: Card(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(4.0))),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("Total"),
          //           Text("100"),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

