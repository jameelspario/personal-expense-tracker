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

  Future initHomeItems() async {
    homeItems = await table.retrieveAll();
    emit(HomeData());
  }

  /* 
    sort data
   */
  Future retrieveSort(int index) async {
    // homeItems = await table.retrieveAll();
    // emit(HomeData());
 
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
      emit(HomeLoaded());
    } catch (e) {
      emit(HomeLoaded());
      emit(HomeError(e.toString()));
    }
  }

  editItem(item) {
    emit(HomeLoaded());
    emit(EditExpenseState(item));
  }
}
