import 'package:flutter/material.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/values.dart';

class OnBoardingPageTwo extends StatelessWidget {
  const OnBoardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.deviceHeight,
      width: AppValues.deviceWidth,
      color: AppColors.accentDarkYellow,
    );
  }
}
