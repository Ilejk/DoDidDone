import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_app/common/helpers/db_helper.dart';
import 'package:todo_app/common/models/taks_model.dart';

void main() {
  sqfliteFfiInit();

  group(
    'DBHelper',
    () {
      late sql.Database database;
      setUp(
        () async {
          databaseFactory = databaseFactoryFfi;
          database =
              await sql.databaseFactory.openDatabase(inMemoryDatabasePath);
          await DBHelper.createTables(database);
        },
      );
      test(
        'createItem adds a task to the database',
        () async {
          final newTask = TaskModel(
            title: 'New Task',
            description: 'New Description',
            startTime: '03:00 PM',
            endTime: '04:00 PM',
            date: '2023-07-27',
            isCompleted: 0,
          );
          final insertedId = await DBHelper.createItem(newTask);
          expect(insertedId, isNotNull);
          final taskFromDB = await DBHelper.getItem(insertedId);
          expect(taskFromDB, isNotNull);
          expect(
            taskFromDB[0]['title'],
            equals('New Task'),
          );
        },
      );
      test(
        'deleteItem removes a task from the database',
        () async {
          final newTask = TaskModel(
            title: 'New Task',
            description: 'New Description',
            startTime: '03:00 PM',
            endTime: '04:00 PM',
            date: '2023-07-27',
            isCompleted: 0,
          );
          final insertedId = await DBHelper.createItem(newTask);
          expect(insertedId, isNotNull);
          await DBHelper.deleteItem(insertedId);
          final taskFromDB = await DBHelper.getItem(insertedId);
          expect(taskFromDB, isEmpty);
        },
      );
      tearDown(
        () async {
          await database.close();
        },
      );
    },
  );
}
