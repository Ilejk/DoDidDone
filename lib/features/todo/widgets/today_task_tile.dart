import 'package:todo_app/common/export/export.dart';

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

        return TODOtile(
          title: data.title,
          description: data.description,
          startTime: data.startTime,
          endTime: data.endTime,
          color: AppColors.lightPurple,
          deleteFunction: () {
            ref
                .read(tODOStateProviderProvider.notifier)
                .deleteItem(data.id ?? 0);
          },
          editWidget: GestureDetector(
            onTap: () {
              TITLE = data.title.toString();
              DESCRIPTION = data.description.toString();
              GBM.pushNamed(
                context: context,
                routeName: Routes.updateTaskRoute,
                arguments: data.id ?? 0,
              );
            },
            child: Icon(
              MaterialCommunityIcons.circle_edit_outline,
              color: AppColors.lightPurple,
            ),
          ),
          completeWidget: GestureDetector(
            onTap: () {
              ref.read(tODOStateProviderProvider.notifier).markAsCompleted(
                    data.id ?? 0,
                    data.title.toString(),
                    data.description.toString(),
                    data.endTime.toString(),
                    data.startTime.toString(),
                    data.date.toString(),
                    1,
                  );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryDarkGrey,
                borderRadius: BorderRadius.circular(AppConsts.kRadius),
                border: Border.all(
                  color: AppColors.lightOrange,
                  width: AppSizes.s1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p4.h,
                  horizontal: AppPadding.p8.w,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.done_all_sharp,
                      color: AppColors.lightOrange,
                      size: AppSizes.s35,
                    ),
                    ReusableTextWidget(
                      text: AppStrings.taskComplete,
                      textStyle: appTextStyle(
                        fontSize: AppFontSizes.fs10,
                        color: AppColors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
