import 'package:flutter/material.dart';
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
            children: [
              OnBoardingPageOne(),
              OnBoardingPageTwo(),
            ],
          ),
        ],
      ),
    );
  }
}
