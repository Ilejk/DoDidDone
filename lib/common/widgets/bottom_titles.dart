import 'package:todo_app/common/export/export.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.deviceWidth,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: AppSizes.s80.h,
                  width: AppSizes.s5.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightOrange, //TODO
                    borderRadius: BorderRadius.circular(AppConsts.kRadius),
                  ),
                );
              },
            ),
            WidthSpacer(wi: AppSizes.s15.w),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableTextWidget(
                    text: title,
                    textStyle: appTextStyle(
                      fontSize: AppFontSizes.fs18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  HeightSpacer(he: AppSizes.s10.h),
                  ReusableTextWidget(
                    text: subtitle,
                    maxLines: 2,
                    textStyle: appTextStyle(
                      fontSize: AppFontSizes.fs15,
                      color: AppColors.white54,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
