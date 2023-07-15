import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/strings.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/expansion_tile.dart';
import 'package:todo_app/features/todo/controllers/expansion/expansion_provider.dart';
import 'package:todo_app/features/todo/controllers/todo/todo_provider.dart';
import 'package:todo_app/features/todo/widgets/todo_tile.dart';

class TomorrowTaskList extends ConsumerWidget {
  const TomorrowTaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tODOStateProviderProvider);
    String tomorrow =
        ref.read(tODOStateProviderProvider.notifier).getTomorrow();
    var tomorrowsTasks = tasks.where(
      (element) => element.isCompleted == 0 && element.date!.contains(tomorrow),
    );
    dynamic color =
        ref.read(tODOStateProviderProvider.notifier).getRandomColor();

    return ExpansionTiles(
      title: AppStrings.homeTomorrowsTitle,
      subtitle: AppStrings.homeTomorrowsSubTitle,
      trailing: Padding(
        padding: EdgeInsets.only(right: AppPadding.p12.w),
        child: ref.watch(expansionStateProvider)
            ? Icon(
                AntDesign.circledown,
                color: AppColors.lightOrange,
              )
            : Icon(
                AntDesign.closecircleo,
                color: AppColors.lightOrange,
              ),
      ),
      onExpnasioncahned: (bool expanded) {
        ref.watch(expansionStateProvider.notifier).setStart(!expanded);
      },
      children: [
        for (final task in tomorrowsTasks)
          TODOtile(
            startTime: task.startTime,
            endTime: task.endTime,
            title: task.title,
            description: task.description,
            color: color,
            deleteFunction: () {
              ref
                  .read(tODOStateProviderProvider.notifier)
                  .deleteItem(task.id ?? 0);
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
            switchWidget: const SizedBox.shrink(),
          )
      ],
    );
  }
}
