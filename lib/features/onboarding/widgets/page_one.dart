import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/common/utils/manager/assets.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/spacers.dart';

class OnBoardingPageOne extends StatelessWidget {
  const OnBoardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.deviceHeight,
      width: AppValues.deviceWidth,
      color: AppColors.primaryDarkGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(AppAnimations.onboarding1),
          const HeightSpacer(he: AppSizes.s30),
          ReusableTextWidget(
            text: 'Track your daily tasks\nwith ease!',
            maxLines: 2,
            textAlign: TextAlign.center,
            textStyle: appTextStyle(
              fontSize: AppFontSizes.fs25,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          )
        ],
      ),
    );
  }
}
