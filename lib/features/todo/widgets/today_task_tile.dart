import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/models/taks_model.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_app/features/todo/widgets/todo_tile.dart';

class TodayTasks extends ConsumerWidget {
  const TodayTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.watch(tODOStateProviderProvider);
    String today = ref.read(tODOStateProviderProvider.notifier).getToday();
    List<TaskModel> todaysList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();

    return ListView.builder(
      itemCount: todaysList.length,
      itemBuilder: (context, index) {
        final data = todaysList[index];
        bool isCompleted =
            ref.read(tODOStateProviderProvider.notifier).getStatus(data);
        dynamic color =
            ref.read(tODOStateProviderProvider.notifier).getRandomColor();
        return TODOtile(
          title: data.title,
          description: data.description,
          startTime: data.startTime,
          endTime: data.endTime,
          color: color,
          deleteFunction: () {
            ref
                .read(tODOStateProviderProvider.notifier)
                .deleteItem(data.id ?? 0);
          },
          editWidget: GestureDetector(
            onTap: () {
              //TODO
            },
            child: Icon(
              MaterialCommunityIcons.circle_edit_outline,
              color: AppColors.lightPurple,
            ),
          ),
          switchWidget: RotatedBox(
            quarterTurns: 3,
            child: CupertinoSwitch(
              value: isCompleted,
              onChanged: (value) {},
              thumbColor: AppColors.lightOrange,
              activeColor: AppColors.lightPurple,
              trackColor: AppColors.secondaryDarkGrey,
            ),
          ),
        );
      },
    );
  }
}
