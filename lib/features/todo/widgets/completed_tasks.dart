import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/models/taks_model.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_app/features/todo/widgets/todo_tile.dart';

class CompletedTasks extends ConsumerWidget {
  const CompletedTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.watch(tODOStateProviderProvider);
    List lastMonth =
        ref.read(tODOStateProviderProvider.notifier).getLast30days();
    List<TaskModel> completedTasks = listData
        .where(
          (element) =>
              element.isCompleted == 1 ||
              lastMonth.contains(
                element.date!.substring(0, 10),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: completedTasks.length,
      itemBuilder: (context, index) {
        final data = completedTasks[index];

        return TODOtile(
          title: data.title,
          description: data.description,
          startTime: data.startTime,
          endTime: data.endTime,
          color: AppColors.green,
          deleteFunction: () {
            ref
                .read(tODOStateProviderProvider.notifier)
                .deleteItem(data.id ?? 0);
          },
          editWidget: const SizedBox.shrink(),
          switchWidget: const SizedBox.shrink(),
        );
      },
    );
  }
}
