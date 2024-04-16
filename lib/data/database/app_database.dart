import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'table_expense.dart';

abstract class AppDatabase {
  int version = 1;

  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'appDatabase.db'), version: version,
        onCreate: (Database db, int version) async {
      await db.execute(ExpenseTable.db1);
    }, onUpgrade: (db, vold, vnew) async {
      if (vnew > vold) {
        await db.execute(ExpenseTable.drop1);

        await db.execute(ExpenseTable.db1);
      }
    });
  }

  String table();

  Future<Database> getDb() async {
    return await initializedDB();
  }

  Future clearTable() async {
    final db = await getDb();
    db.delete(table());
  }

  Future delete(id) async {
    final db = await getDb();
    await db.delete(table(), where: "id=?", whereArgs: [id]);
  }

  Future insert(dynamic data) async {
    final db = await initializedDB();
    return await db.insert(table(), data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertAll(List datas) async {
    int result = 0;
    final db = await getDb();
    for (var data in datas) {

      result = await db.insert(table(), data.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

   Future update(dynamic data) async {
    final db = await initializedDB();
    return await db.update(table(), data.toMap());
  }

}
