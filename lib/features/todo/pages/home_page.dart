import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/utils/constants/constants.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizes.s85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableTextWidget(
                      text: 'Dashboard',
                      textStyle: appTextStyle(
                          fontSize: AppFontSizes.fs18,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: AppSizes.s25.w,
                      height: AppSizes.s25.w,
                      decoration: BoxDecoration(
                        color: AppColors.accentDarkYellow,
                        borderRadius: BorderRadius.circular(AppConsts.kRadius),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
