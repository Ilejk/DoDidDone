import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/common/global/global_methods.dart';
import 'package:todo_app/common/utils/constants/constants.dart';
import 'package:todo_app/common/utils/manager/assets.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/strings.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/custom_outline_button.dart';
import 'package:todo_app/common/widgets/custom_textfield.dart';
import 'package:todo_app/common/widgets/spacers.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:todo_app/features/todo/controllers/dates/date_provider.dart';
import 'package:todo_app/features/todo/controllers/todo/todo_provider.dart';

class UpdateTaskPage extends ConsumerStatefulWidget {
  const UpdateTaskPage({required this.id, super.key});
  final int id;

  @override
  ConsumerState<UpdateTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<UpdateTaskPage> {
  final TextEditingController titleController =
      TextEditingController(text: TITLE);
  final TextEditingController descriptionController =
      TextEditingController(text: DESCRIPTION);
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scheduledDate = ref.watch(dateStateProvider);
    var scheduledStartTime = ref.watch(startTimeStateProvider);
    var scheduledEndtime = ref.watch(endTimeStateProvider);
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
                          .read(startTimeStateProvider.notifier)
                          .setStartTime(date.toString());
                    }, locale: picker.LocaleType.en);
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
                var fieldsAreNotEmpty = scheduledEndtime != AppConsts.empty &&
                    scheduledStartTime != AppConsts.empty &&
                    scheduledDate != AppConsts.empty &&
                    titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty;
                if (fieldsAreNotEmpty) {
                  ref.read(tODOStateProviderProvider.notifier).updateItem(
                        widget.id,
                        titleController.text,
                        descriptionController.text,
                        scheduledEndtime.substring(10, 16),
                        scheduledStartTime.substring(10, 16),
                        scheduledDate.substring(0, 10),
                        0,
                      );
                  ref
                      .read(endTimeStateProvider.notifier)
                      .setEndTime(AppConsts.empty);
                  ref
                      .read(startTimeStateProvider.notifier)
                      .setStartTime(AppConsts.empty);
                  ref.read(dateStateProvider.notifier).setDate(AppConsts.empty);
                  GBM.pop(context: context);
                } else {
                  print('error');
                }
              },
              width: AppValues.deviceWidth,
              height: AppSizes.s50.h,
              bgColor: AppColors.lightOrange,
              borderColor: AppColors.lightOrange,
              textColor: AppColors.white,
              title: AppStrings.updateTask,
            ),
          ],
        ),
      ),
    );
  }
}
