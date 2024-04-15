import 'package:personal_expense_tracker/data/database/app_database.dart';

import '../../domain/models/expense_model.dart';

class ExpenseTable extends AppDatabase {
  static const String TABLE = "ExpenseTable";
  static const String ID = "id";
  static const String title = "title";
  static const String amount = "amount";
  static const String dateTime = "dateTime";
  static const String description = "description";

  @override
  String table() => TABLE;

  static String db1 =
      "CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      " $title TEXT,"
      " $amount TEXT,"
      " $description TEXT,"
      " $dateTime TEXT"
      ")";

  static String drop1 = "DROP TABLE IF EXISTS $TABLE";

  Future retrieveAll() async {
    final db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query(TABLE);
    return queryResult.map((e) => ExpenseModel.fromMap(e)).toList();
  }
}
