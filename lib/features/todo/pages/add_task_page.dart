import 'package:flutter/cupertino.dart';
import 'package:todo_app/common/export/export.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({super.key});

  @override
  ConsumerState<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<AddTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late NotificationsHelper notificationsHelper;
  late NotificationsHelper controller;
  List<int> notifications = [];
  @override
  void initState() {
    super.initState();
    notificationsHelper = NotificationsHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0),
        () => controller = NotificationsHelper(ref: ref));
    notificationsHelper.initializeNotifications();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String scheduledDate = ref.watch(dateStateProvider);
    String scheduledStartTime = ref.watch(startTimeStateProvider);
    String scheduledEndtime = ref.watch(endTimeStateProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GBM.pop(context: context),
          icon: Icon(
            CupertinoIcons.arrow_left_circle_fill,
            color: AppColors.lightOrange,
            size: AppSizes.s30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
        child: ListView(
          children: [
            LottieBuilder.asset(AppAnimations.onboarding2),
            HeightSpacer(he: AppSizes.s20.h),
            CustomTextField(
              bgColor: AppColors.secondaryDarkGrey,
              hintText: AppStrings.addTaskTitleHint,
              hintStyle: appTextStyle(
                fontSize: AppFontSizes.fs15,
                color: AppColors.white54,
                fontWeight: FontWeight.normal,
              ),
              controller: titleController,
              textFieldStyle: appTextStyle(
                fontSize: AppFontSizes.fs18,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            HeightSpacer(he: AppSizes.s20.h),
            CustomTextField(
              bgColor: AppColors.secondaryDarkGrey,
              hintText: AppStrings.addTaskDescriptionHint,
              hintStyle: appTextStyle(
                fontSize: AppFontSizes.fs15,
                color: AppColors.white54,
                fontWeight: FontWeight.normal,
              ),
              controller: descriptionController,
              textFieldStyle: appTextStyle(
                fontSize: AppFontSizes.fs18,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            HeightSpacer(he: AppSizes.s20.h),
            CustomOutlineButton(
              onTap: () {
                picker.DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2050, 12, 31),
                  theme: picker.DatePickerTheme(
                    headerColor: AppColors.secondaryDarkGrey,
                    backgroundColor: AppColors.primaryDarkGrey,
                    itemStyle: appTextStyle(
                      fontSize: AppFontSizes.fs18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    doneStyle: appTextStyle(
                      fontSize: AppFontSizes.fs15,
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    cancelStyle: appTextStyle(
                      fontSize: AppFontSizes.fs15,
                      color: AppColors.lightOrange,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onConfirm: (date) {
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  },
                  currentTime: DateTime.now(),
                  locale: picker.LocaleType.en,
                );
              },
              width: AppValues.deviceWidth,
              height: AppSizes.s50.h,
              bgColor: AppColors.secondaryDarkGrey,
              borderColor: AppColors.secondaryDarkGrey,
              textColor: AppColors.white,
              title: scheduledDate == AppConsts.empty
                  ? AppStrings.addTaskDate
                  : scheduledDate.substring(0, 10),
            ),
            HeightSpacer(he: AppSizes.s20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineButton(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      theme: picker.DatePickerTheme(
                        headerColor: AppColors.secondaryDarkGrey,
                        backgroundColor: AppColors.primaryDarkGrey,
                        itemStyle: appTextStyle(
                          fontSize: AppFontSizes.fs18,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        doneStyle: appTextStyle(
                          fontSize: AppFontSizes.fs15,
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                        ),
                        cancelStyle: appTextStyle(
                          fontSize: AppFontSizes.fs15,
                          color: AppColors.lightOrange,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onConfirm: (date) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStartTime(date.toString());
                        notifications = ref
                            .read(startTimeStateProvider.notifier)
                            .dates(date);
                      },
                      locale: picker.LocaleType.en,
                    );
                  },
                  width: AppValues.deviceWidth * 0.4,
                  height: AppSizes.s50.h,
                  bgColor: AppColors.secondaryDarkGrey,
                  borderColor: AppColors.secondaryDarkGrey,
                  textColor: AppColors.white,
                  title: scheduledStartTime == AppConsts.empty
                      ? AppStrings.addTaskStartTime
                      : scheduledStartTime.substring(10, 16),
                ),
                CustomOutlineButton(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        theme: picker.DatePickerTheme(
                          headerColor: AppColors.secondaryDarkGrey,
                          backgroundColor: AppColors.primaryDarkGrey,
                          itemStyle: appTextStyle(
                            fontSize: AppFontSizes.fs18,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          doneStyle: appTextStyle(
                            fontSize: AppFontSizes.fs15,
                            color: AppColors.white,
                            fontWeight: FontWeight.normal,
                          ),
                          cancelStyle: appTextStyle(
                            fontSize: AppFontSizes.fs15,
                            color: AppColors.lightOrange,
                            fontWeight: FontWeight.normal,
                          ),
                        ), onConfirm: (date) {
                      ref
                          .read(endTimeStateProvider.notifier)
                          .setEndTime(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  width: AppValues.deviceWidth * 0.4,
                  height: AppSizes.s50.h,
                  bgColor: AppColors.secondaryDarkGrey,
                  borderColor: AppColors.secondaryDarkGrey,
                  textColor: AppColors.white,
                  title: scheduledEndtime == AppConsts.empty
                      ? AppStrings.addTaskEndTime
                      : scheduledEndtime.substring(10, 16),
                ),
              ],
            ),
            HeightSpacer(he: AppSizes.s50.h),
            CustomOutlineButton(
              onTap: () {
                bool fieldsAreNotEmpty = scheduledEndtime != AppConsts.empty &&
                    scheduledStartTime != AppConsts.empty &&
                    scheduledDate != AppConsts.empty &&
                    titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty;
                if (fieldsAreNotEmpty) {
                  TaskModel task = TaskModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    isCompleted: 0,
                    date: scheduledDate.substring(0, 10),
                    startTime: scheduledStartTime.substring(10, 16),
                    endTime: scheduledEndtime.substring(10, 16),
                    reminder: 0,
                    repeat: 'yes',
                  );
                  notificationsHelper.scheduledNotifications(
                    notifications[0],
                    notifications[1],
                    notifications[2],
                    notifications[3],
                    task,
                  );
                  ref.read(tODOStateProviderProvider.notifier).addItem(task);

                  GBM.pushAndReplaceNamed(
                      context: context, routeName: Routes.homeRoute);
                } else {
                  showAlertDialog(
                      context: context, message: 'Failed to add the task');
                }
              },
              width: AppValues.deviceWidth,
              height: AppSizes.s50.h,
              bgColor: AppColors.lightOrange,
              borderColor: AppColors.lightOrange,
              textColor: AppColors.white,
              title: AppStrings.addTaskAdd,
            ),
          ],
        ),
      ),
    );
  }
}
