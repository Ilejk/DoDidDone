import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/common/global/global_methods.dart';
import 'package:todo_app/common/routes/router.dart';
import 'package:todo_app/common/utils/manager/assets.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/custom_outline_button.dart';
import 'package:todo_app/common/widgets/spacers.dart';

class OnBoardingPageTwo extends StatelessWidget {
  const OnBoardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.deviceHeight,
      width: AppValues.deviceWidth,
      color: AppColors.primaryDarkGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(AppAnimations.onboarding2),
          const HeightSpacer(he: AppSizes.s30),
          CustomOutlineButton(
            onTap: () => GBM.pushAndReplaceNamed(
                context: context, routeName: Routes.loginRoute),
            width: AppValues.deviceWidth * 0.9,
            height: AppValues.deviceHeight * 0.06,
            bgColor: AppColors.secondaryDarkGrey,
            borderColor: AppColors.lightOrange,
            textColor: AppColors.white,
            title: 'Login with a phone number',
          )
        ],
      ),
    );
  }
}
