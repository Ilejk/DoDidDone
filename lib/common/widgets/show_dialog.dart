import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/common/global/global_methods.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? buttonText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: ReusableTextWidget(
          text: message,
          textStyle: appTextStyle(
            fontSize: AppFontSizes.fs18,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(
          AppPadding.p20.w,
          AppPadding.p20.h,
          AppPadding.p20.w,
          AppPadding.p2.h,
        ),
        actions: [
          TextButton(
            onPressed: () => GBM.pop(context: context),
            child: ReusableTextWidget(
              text: buttonText ?? 'OK',
              textStyle: appTextStyle(
                fontSize: AppFontSizes.fs18,
                color: AppColors.lightOrange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
}
