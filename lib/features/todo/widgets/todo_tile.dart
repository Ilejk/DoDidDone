import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_app/common/utils/constants/constants.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/spacers.dart';

class TODOtile extends StatelessWidget {
  const TODOtile({
    super.key,
    this.title,
    this.description,
    this.startTime,
    this.endTime,
    this.editWidget,
    this.deleteFunction,
    this.switchWidget,
  });
  final String? title;
  final String? description;
  final String? startTime;
  final String? endTime;
  final Widget? editWidget;
  final void Function()? deleteFunction;
  final Widget? switchWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppPadding.p8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(AppPadding.p8.h),
            width: AppValues.deviceWidth,
            decoration: BoxDecoration(
              color: AppColors.accentDarkGrey,
              borderRadius: BorderRadius.circular(AppConsts.kRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: AppSizes.s80.h,
                      width: AppSizes.s5.w,
                      decoration: BoxDecoration(
                        color: AppColors.lightOrange,
                        borderRadius: BorderRadius.circular(AppConsts.kRadius),
                      ),
                    ),
                    WidthSpacer(wi: AppSizes.s15.w),
                    Padding(
                      padding: EdgeInsets.all(AppPadding.p8.h),
                      child: SizedBox(
                        width: AppValues.deviceWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableTextWidget(
                              text: title ?? 'title',
                              textStyle: appTextStyle(
                                fontSize: AppFontSizes.fs18,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            HeightSpacer(he: AppSizes.s2.h),
                            ReusableTextWidget(
                              text: description ?? 'description',
                              textStyle: appTextStyle(
                                fontSize: AppFontSizes.fs15,
                                color: AppColors.white54,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            HeightSpacer(he: AppSizes.s10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: AppValues.deviceWidth * 0.3,
                                  height: AppSizes.s25.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryDarkGrey,
                                    border: Border.all(
                                        width: AppSizes.s0_3,
                                        color: AppColors.secondaryDarkGrey),
                                    borderRadius: BorderRadius.circular(
                                      AppConsts.kRadius,
                                    ),
                                  ),
                                  child: Center(
                                    child: ReusableTextWidget(
                                      text: '$startTime | $endTime',
                                      textAlign: TextAlign.center,
                                      textStyle: appTextStyle(
                                        fontSize: AppFontSizes.fs12,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                WidthSpacer(wi: AppSizes.s20.w),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    WidthSpacer(wi: AppSizes.s20.w),
                                    GestureDetector(
                                      onTap: deleteFunction,
                                      child: Icon(
                                        MaterialCommunityIcons.delete,
                                        color: AppColors.lightOrange,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: switchWidget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
