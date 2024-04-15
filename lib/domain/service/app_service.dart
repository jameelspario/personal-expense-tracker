


import 'package:sqflite/sqflite.dart';

class ExpenseService {
  late Database db;

  ExpenseService._privateConstructor();
  static final ExpenseService instance = ExpenseService._privateConstructor();

  Future initialize(String path) async {
    // db = ;
  }

  // Future<Task> insert(Task task) async {
  //   task.id = await db.insert(tableTodo, task.toMap());
  //   return task;
  // }

  // Future<List<Task>?> getAllTask() async {
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   var p = await db.rawQuery('SELECT * FROM $tableTodo');
  //   var list;
  //   list = List<Task>.from(p.map((e) => Task.fromMap(e)));
  //   return list;
  // }

  // Future<Task?> getTask(int id) async {
  //   List<Map> maps = await db.query(tableTodo,
  //       columns: [columnId, columnDone, columnTitle, columnDesc],
  //       where: '$columnId = ?',
  //       whereArgs: [id]);
  //   if (maps.isNotEmpty) {
  //     return Task.fromMap(maps.first as Map<String, dynamic>);
  //   }
  //   return null;
  // }

  // Future<int?> delete(int id) async {
  //   return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int?> update(Task task) async {
  //   return await db.update(tableTodo, task.toMap(),
  //       where: '$columnId = ?', whereArgs: [task.id]);
  // }

  // Future close() async => db.close();
}
