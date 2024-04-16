import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/presentation/view/add_expense/add_expense.dart';
import 'package:personal_expense_tracker/presentation/view/home/item_expense.dart';
import 'package:personal_expense_tracker/presentation/widgets/fade_route.dart';
import 'package:personal_expense_tracker/utils/constants.dart';
import 'package:personal_expense_tracker/utils/extensions.dart';

import '../cubit/auth/auth_cubit.dart';
import '../cubit/home/home_cubit.dart';
import '../widgets/dialogs.dart';
import 'detail_expense/detail_expense.dart';
import 'edit/edit_expense.dart';
import 'home/item_sort_cord.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = context.watch<AuthCubit>();
    return SafeArea(
      child: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is HomeLoading) {
              Dialogs.loadingDialog(context);
            }
            if (state is HomeLoaded) {
              Navigator.pop(context);
            }
            if (state is HomeError) {
              Dialogs.snackbar(context, state.message);
            }
            if (state is DetailExpenseState) {
              final bloc = BlocProvider.of<HomeCubit>(context);

              Navigator.push(
                  context,
                  FadeRoute(
                      page: BlocProvider.value(
                    value: BlocProvider.of<HomeCubit>(context),
                    child: DetailExpense(
                      item: state.item,
                      callback: () => bloc.editItem(state.item),
                    ),
                  )));
            }

            // if (state is DetailExpenseState) {
            //   Navigator.push(context, FadeRoute(page: DetailExpense(item: state.item, callback:()=> bloc.editItem(state.item),)));
            // }
          },
          builder: (context, state) {
            // print(state);
            if (state is AddExpenseState) {
              return const AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: AddExpense(),
              );
            }
            if (state is EditExpenseState) {
              return EditExpense(
                item: state.item,
              );
            }

            return Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Strings.manageExpense,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      24.0.spaceY,
                      const ItemSortCard(),
                      24.0.spaceY,
                      Expanded(
                        child: Builder(builder: (_) {
                          final bloc = BlocProvider.of<HomeCubit>(context);
                          return bloc.homeItems.isEmpty
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: Center(
                                      child: Text(Strings.mesg1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge)),
                                )
                              : ListView.separated(
                                  // shrinkWrap: true,
                                  itemBuilder: (_, i) => ItemExpense(
                                    item: bloc.homeItems[i],
                                    callback: () => bloc
                                        .gotoDetailExpense(bloc.homeItems[i]),
                                  ),
                                  separatorBuilder: (_, i) => Container(),
                                  itemCount: bloc.homeItems.length,
                                );
                        }),
                      )
                    ]),
              ),
              floatingActionButton: FloatingActionButton.small(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)),
                backgroundColor: Colors.black,
                onPressed: () async {
                  final bloc = BlocProvider.of<HomeCubit>(context);
                  bloc.gotoAddExpense();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
