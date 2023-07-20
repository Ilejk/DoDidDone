import 'package:todo_app/common/export/export.dart';

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
            text: AppStrings.onboardingTitle1,
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
