import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/constants/constants.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.title,
  });
  final void Function()? onTap;
  final double width;
  final double height;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppConsts.kRadius),
          border: Border.all(
            color: borderColor,
            width: AppSizes.s1,
          ),
        ),
        child: Center(
          child: ReusableTextWidget(
            text: title,
            textStyle: appTextStyle(
              fontSize: AppFontSizes.fs18,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
