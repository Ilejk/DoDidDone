import 'package:todo_app/common/export/export.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key, this.payload});
  final String? payload;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p20.w,
                vertical: AppPadding.p20.h,
              ),
              child: Container(
                width: AppValues.deviceWidth,
                height: AppValues.deviceHeight * 0.7,
                decoration: BoxDecoration(
                  color: AppColors.secondaryDarkGrey,
                  borderRadius: BorderRadius.circular(AppConsts.kRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableTextWidget(
                        text: 'Remider',
                        textStyle: appTextStyle(
                          fontSize: AppFontSizes.fs25,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      HeightSpacer(he: AppSizes.s5.h),
                      Container(
                        width: AppValues.deviceWidth,
                        padding: EdgeInsets.only(left: AppPadding.p4.w),
                        decoration: BoxDecoration(
                          color: AppColors.lightOrange,
                          borderRadius:
                              BorderRadius.circular(AppConsts.kRadius),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ReusableTextWidget(
                              text: 'Today',
                              textStyle: appTextStyle(
                                fontSize: AppFontSizes.fs15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            WidthSpacer(wi: AppSizes.s15.w),
                            ReusableTextWidget(
                              text: 'From : start To : End',
                              textStyle: appTextStyle(
                                fontSize: AppFontSizes.fs15,
                                color: AppColors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      HeightSpacer(he: AppSizes.s10.h),
                      ReusableTextWidget(
                        text: 'Title',
                        textStyle: appTextStyle(
                          fontSize: AppFontSizes.fs20,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      HeightSpacer(he: AppSizes.s10.h),
                      ReusableTextWidget(
                        text: 'Title',
                        maxLines: 10,
                        textAlign: TextAlign.justify,
                        textStyle: appTextStyle(
                          fontSize: AppFontSizes.fs15,
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: AppSizes.s5.w,
              top: -AppSizes.s30.h,
              child: LottieBuilder.asset(
                AppAnimations.notifcations,
                width: AppSizes.s80.w,
                height: AppSizes.s80.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
