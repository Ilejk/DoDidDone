import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/utils/constants/constants.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/strings.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/custom_textfield.dart';
import 'package:todo_app/common/widgets/expansion_tile.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/spacers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
                      text: AppStrings.homePageAppBarTitle,
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
                      child: GestureDetector(
                        onTap: () {
                          //TODO
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.primaryDarkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HeightSpacer(he: AppSizes.s15.h),
              CustomTextField(
                bgColor: AppColors.secondaryDarkGrey,
                hintText: AppStrings.loginPageSearch,
                suffixIconColor: AppColors.accentDarkYellow,
                prefixIconColor: AppColors.accentDarkYellow,
                hintStyle: appTextStyle(
                    fontSize: AppFontSizes.fs18,
                    color: AppColors.white54,
                    fontWeight: FontWeight.normal),
                controller: searchController,
                textFieldStyle: appTextStyle(
                    fontSize: AppFontSizes.fs18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600),
                suffixIcon: Icon(
                  FontAwesome.sliders,
                  color: AppColors.accentDarkYellow,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(AppPadding.p4),
                  child: GestureDetector(
                    onTap: () {
                      //TODO
                    },
                    child: Icon(
                      AntDesign.search1,
                      color: AppColors.accentDarkYellow,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: ListView(
            children: [
              HeightSpacer(he: AppSizes.s25.h),
              Row(
                children: [
                  Icon(
                    FontAwesome.tasks,
                    color: AppColors.accentDarkYellow,
                    size: AppSizes.s20,
                  ),
                  WidthSpacer(wi: AppSizes.s15.w),
                  ReusableTextWidget(
                    text: AppStrings.homePageTitle,
                    textStyle: appTextStyle(
                      fontSize: AppFontSizes.fs18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              HeightSpacer(he: AppSizes.s25.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryDarkGrey,
                  borderRadius: BorderRadius.circular(AppConsts.kRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p4),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AppColors.accentDarkYellow,
                      borderRadius: BorderRadius.circular(AppConsts.kRadius),
                    ),
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    dividerColor: AppColors.secondaryDarkGrey,
                    labelColor: AppColors.white54,
                    labelStyle: appTextStyle(
                      fontSize: AppFontSizes.fs18,
                      color: AppColors.white54,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelColor: AppColors.secondaryDarkGrey,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppValues.deviceWidth * 0.5,
                          child: Center(
                            child: ReusableTextWidget(
                              text: AppStrings.homePageTab1,
                              textAlign: TextAlign.center,
                              textStyle: appTextStyle(
                                fontSize: AppFontSizes.fs15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: AppPadding.p30.w),
                          width: AppValues.deviceWidth * 0.5,
                          child: Center(
                            child: ReusableTextWidget(
                              text: AppStrings.homePageTab2,
                              textAlign: TextAlign.center,
                              textStyle: appTextStyle(
                                fontSize: AppFontSizes.fs15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              HeightSpacer(he: AppSizes.s20.h),
              SizedBox(
                height: AppValues.deviceHeight * 0.3,
                width: AppValues.deviceWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConsts.kRadius),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppColors.secondaryDarkGrey,
                        height: AppValues.deviceHeight * 0.3,
                      ),
                      Container(
                        color: AppColors.secondaryDarkGrey,
                        height: AppValues.deviceHeight * 0.3,
                      )
                    ],
                  ),
                ),
              ),
              HeightSpacer(he: AppSizes.s20.h),
              const ExpansionTiles(
                title: 'Tomorrow\'s Tasks',
                subtitle: 'Check out your tasks\nfor tomorrow!',
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
