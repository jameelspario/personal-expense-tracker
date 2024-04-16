import 'package:intl/intl.dart';

class Constants {
  static String formatDateTimeStr(String dateTime) {
    try {
      return formatDateTime(DateTime.parse(dateTime));
    } catch (e) {
      return "";
    }
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy h:mm a').format(dateTime);
  }
}

class Strings {
  static const r = "₹";
  static const pleaseWait = "Please wait";
  static const expenseTracker = "Expense Tracker";
  static const manageExpense = "Manage your expenses";
  static const add = "Add";
  static const title = "Title";
  static const expense = "Expense";
  static const addExpense = "Add Expense";
  static const editExpense = "Edit Expense";
  static const dateTime = "Date";
  static const description = "Description";
  static const submit = "Submit";

  static String mesg1 = "No expense added yet";
}
