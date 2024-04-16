import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/database/table_expense.dart';
import '../../../domain/models/expense_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    initHomeItems();
  }

  final table = ExpenseTable();
  List homeItems = [];
  int today = 0;
  int week = 0;
  int month = 0;

  gotoAddExpense() {
    emit(AddExpenseState());
  }

  gotoEditExpense() {
    // emit(EditExpenseState());
  }

  gotoDetailExpense(item) {
    emit(DetailExpenseState(item));
  }

  void gotoHome() {
    emit(HomeData());
  }

  editItem(item) {
    emit(HomeLoaded());
    emit(EditExpenseState(item));
  }

  Future initHomeItems() async {
    homeItems = await table.retrieveAll();
    calculateTotal();
    emit(HomeData());
  }

  /* 
    sort data
   */
  Future retrieveSort(int index) async {
    // homeItems = await table.retrieveAll();
    // emit(HomeData());
  }

  calculateTotal() {
    final date = DateTime.now();
    for (final it in homeItems) {
      try {
        final dateItem = DateTime.parse(it.dateTime);
        if (date.day == dateItem.day) {
          today = today + int.parse(it.amount);
        }

        if (date.weekday == dateItem.weekday) {
          week = week + int.parse(it.amount);
        }

        if (date.month == dateItem.month) {
          month = month + int.parse(it.amount);
        }
      } catch (e) {}
    }
  }

  /* 
  Add new expense
  @text1 : a short title viz. trevel, food, rent, fare
  @text2: expense amount
  @text3: description about the expense
  */
  Future addExpense(text1, text2, text3) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      await table.insert(ExpenseModel(
          title: text1,
          amount: text2,
          dateTime: DateTime.now().toString(),
          description: text3));

      homeItems = await table.retrieveAll();
      calculateTotal();
      emit(HomeLoaded());
    } catch (e) {
      emit(HomeLoaded());
      emit(HomeError(e.toString()));
    }
  }

  Future editExpenseItem(item, text1, text2, text3) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      await table.insert(ExpenseModel(
        id: item.id,
        title: text1,
        amount: text2,
        description: text3,
        dateTime: item.dateTime,
      ));

      homeItems = await table.retrieveAll();
      calculateTotal();
      emit(HomeLoaded());
    } catch (e) {
      emit(HomeLoaded());
      emit(HomeError(e.toString()));
    }
  }

  Future deleteItem(item) async {
    await table.delete(item.id); //remove item from table
    homeItems.remove(item);     //remove item from list
    emit(HomeLoaded());        //close Detail screen and rebuild UI
  }
}
