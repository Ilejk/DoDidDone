import 'package:todo_app/common/export/export.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  late NotificationsHelper notificationsHelper;
  late NotificationsHelper controller;
  @override
  void initState() {
    super.initState();
    notificationsHelper = NotificationsHelper(ref: ref);
    Future.delayed(const Duration(seconds: 0),
        () => controller = NotificationsHelper(ref: ref));
    notificationsHelper.initializeNotifications();
    notificationsHelper.requestIOSPermissions();
  }

  void logout({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    ref.read(authControllerProvider).logout(
          context: context,
        );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(tODOStateProviderProvider.notifier).refresh();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: RotatedBox(
          quarterTurns: 2,
          child: GestureDetector(
            onTap: () => logout(context: context, ref: ref),
            child: Icon(
              IconlyLight.logout,
              size: AppSizes.s25.w,
              color: AppColors.lightOrange,
            ),
          ),
        ),
        title: ReusableTextWidget(
          text: AppStrings.homePageAppBarTitle,
          textStyle: appTextStyle(
            fontSize: AppFontSizes.fs18,
            color: AppColors.white,
            letterSpacing: AppSizes.s1,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPadding.p20.w),
            child: Container(
              width: AppSizes.s25.w,
              height: AppSizes.s25.w,
              decoration: BoxDecoration(
                color: AppColors.lightOrange,
                borderRadius: BorderRadius.circular(AppConsts.kRadius),
              ),
              child: GestureDetector(
                onTap: () => GBM.pushNamed(
                  context: context,
                  routeName: Routes.addTaskRoute,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.primaryDarkGrey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: ListView(
            children: [
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
                      color: AppColors.lightOrange,
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
                          width: AppValues.deviceWidth * 0.3,
                          child: ReusableTextWidget(
                            text: AppStrings.homePageTab1,
                            textAlign: TextAlign.center,
                            textStyle: appTextStyle(
                              fontSize: AppFontSizes.fs14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: AppPadding.p30.w),
                          width: AppValues.deviceWidth * 0.3,
                          child: ReusableTextWidget(
                            text: AppStrings.homePageTab2,
                            textAlign: TextAlign.left,
                            textStyle: appTextStyle(
                              fontSize: AppFontSizes.fs14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: AppPadding.p30.w),
                          width: AppValues.deviceWidth * 0.3,
                          child: ReusableTextWidget(
                            text: AppStrings.homePageTab3,
                            textAlign: TextAlign.left,
                            textStyle: appTextStyle(
                              fontSize: AppFontSizes.fs14,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
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
                height: AppValues.deviceHeight * 0.7,
                width: AppValues.deviceWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConsts.kRadius),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppColors.secondaryDarkGrey,
                        height: AppValues.deviceHeight * 0.3,
                        child: const TodayTasks(),
                      ),
                      Container(
                        color: AppColors.secondaryDarkGrey,
                        height: AppValues.deviceHeight * 0.3,
                        child: const TomorrowTaskList(),
                      ),
                      Container(
                        color: AppColors.secondaryDarkGrey,
                        height: AppValues.deviceHeight * 0.3,
                        child: const CompletedTasks(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
