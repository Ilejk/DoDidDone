import 'package:todo_app/common/export/export.dart';

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
            title: AppStrings.page2Login,
          )
        ],
      ),
    );
  }
}
