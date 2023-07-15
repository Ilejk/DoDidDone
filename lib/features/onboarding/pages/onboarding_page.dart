import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/spacers.dart';
import 'package:todo_app/features/onboarding/widgets/page_one.dart';
import 'package:todo_app/features/onboarding/widgets/page_two.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              OnBoardingPageOne(),
              OnBoardingPageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p20.w,
                vertical: AppPadding.p30.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Ionicons.chevron_forward_circle,
                          size: AppSizes.s30,
                          color: AppColors.white,
                        ),
                        const WidthSpacer(wi: AppSizes.s5),
                        ReusableTextWidget(
                          text: 'Skip',
                          textStyle: appTextStyle(
                            fontSize: AppFontSizes.fs15,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO
                    },
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: WormEffect(
                        dotHeight: AppSizes.s10,
                        dotWidth: AppSizes.s15,
                        spacing: AppSizes.s10,
                        activeDotColor: AppColors.lightOrange,
                        dotColor: AppColors.accentDarkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
