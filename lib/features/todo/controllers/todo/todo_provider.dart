import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/common/helpers/db_helper.dart';
import 'package:todo_app/common/models/taks_model.dart';
import 'package:todo_app/common/utils/constants/constants.dart';

part 'todo_provider.g.dart';

@riverpod
class TODOStateProvider extends _$TODOStateProvider {
  @override
  List<TaskModel> build() {
    return [];
  }

  Future<void> refresh() async {
    final data = await DBHelper.getItems();
    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<void> addItem(TaskModel taskModel) async {
    await DBHelper.createItem(taskModel);
    refresh();
  }

  Future<void> updateItem(int id, String title, String description,
      String endTime, String startTime, String date, int isCompleted) async {
    await DBHelper.updateItem(
      id,
      title,
      description,
      startTime,
      endTime,
      date,
      isCompleted,
    );
    refresh();
  }

  Future<void> deleteItem(int id) async {
    await DBHelper.deleteItem(id);
    refresh();
  }

  Future<void> markAsCompleted(
    int id,
    String title,
    String description,
    String endTime,
    String startTime,
    String date,
  ) async {
    await DBHelper.updateItem(
      id,
      title,
      description,
      startTime,
      endTime,
      date,
      1,
    );
    refresh();
  }

  dynamic getRandomColor() {
    Random random = Random();
    int randomIndex = random.nextInt(AppConsts.colors.length);
    return AppConsts.colors[randomIndex];
  }

  String getToday() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  String getTomorrow() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.toString().substring(0, 10);
  }

  List<String> getLast30days() {
    DateTime today = DateTime.now();
    DateTime oneMontchAgo = today.subtract(const Duration(days: 30));
    List<String> dates = [];
    for (int i = 0; i < 30; i++) {
      DateTime date = oneMontchAgo.add(Duration(days: i));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(TaskModel taskModel) {
    bool? isCompleted;
    var isNotCompleted = taskModel.isCompleted == 0;
    if (isNotCompleted) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    return isCompleted;
  }
}
