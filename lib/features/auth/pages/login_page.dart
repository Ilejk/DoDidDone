import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/common/utils/constants/constants.dart';
import 'package:todo_app/common/utils/manager/assets.dart';
import 'package:todo_app/common/utils/manager/colors.dart';
import 'package:todo_app/common/utils/manager/strings.dart';
import 'package:todo_app/common/utils/manager/values.dart';
import 'package:todo_app/common/widgets/app_text_style.dart';
import 'package:todo_app/common/widgets/custom_outline_button.dart';
import 'package:todo_app/common/widgets/custom_textfield.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/spacers.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  Country country = Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'USA',
    example: 'USA',
    displayName: 'United States',
    displayNameNoCountryCode: 'US',
    e164Key: '',
  );
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p30.w),
                child: LottieBuilder.asset(AppAnimations.login),
              ),
              const HeightSpacer(he: AppSizes.s25),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: AppPadding.p12.w),
                child: ReusableTextWidget(
                  text: AppStrings.loginPageTitle,
                  textStyle: appTextStyle(
                    fontSize: AppFontSizes.fs15,
                    color: AppColors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const HeightSpacer(he: AppSizes.s20),
              Center(
                child: CustomTextField(
                  bgColor: AppColors.secondaryDarkGrey,
                  hintText: AppStrings.loginPageHint,
                  keyboardType: TextInputType.phone,
                  suffixIconColor: AppColors.accentDarkYellow,
                  prefixIconColor: AppColors.white,
                  hintStyle: appTextStyle(
                    fontSize: AppFontSizes.fs15,
                    color: AppColors.white54,
                    fontWeight: FontWeight.normal,
                  ),
                  controller: phoneController,
                  textFieldStyle: appTextStyle(
                    fontSize: AppFontSizes.fs18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(AppPadding.p4.w),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            textStyle: appTextStyle(
                              fontSize: AppFontSizes.fs15,
                              color: AppColors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            searchTextStyle: appTextStyle(
                              fontSize: AppFontSizes.fs15,
                              color: AppColors.white,
                              fontWeight: FontWeight.normal,
                            ),
                            inputDecoration: InputDecoration(
                              fillColor: AppColors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppConsts.kRadius),
                                borderSide: BorderSide(
                                  color: AppColors.secondaryDarkGrey,
                                  width: AppSizes.s1,
                                ),
                              ),
                              hintText: AppStrings.loginPageSearch,
                              hintStyle: appTextStyle(
                                fontSize: AppFontSizes.fs15,
                                color: AppColors.white54,
                                fontWeight: FontWeight.normal,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppConsts.kRadius),
                                borderSide: BorderSide(
                                  color: AppColors.accentDarkYellow,
                                  width: AppSizes.s1,
                                ),
                              ),
                            ),
                            backgroundColor: AppColors.primaryDarkGrey,
                            bottomSheetHeight: AppValues.deviceHeight * 0.6,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(AppConsts.kRadius),
                              topRight: Radius.circular(AppConsts.kRadius),
                            ),
                          ),
                          onSelect: (code) {
                            setState(() {});
                          },
                        );
                      },
                      child: ReusableTextWidget(
                        text: '${country.flagEmoji} + ${country.phoneCode}',
                        textStyle: appTextStyle(
                          fontSize: AppFontSizes.fs18,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: Container(
                    padding: EdgeInsets.all(AppPadding.p4.w),
                    child: GestureDetector(
                      onTap: () {
                        //TODO
                      },
                      child: Icon(Icons.abc),
                    ),
                  ),
                  onChaned: (value) {
                    //TODO
                  },
                ),
              ),
              const HeightSpacer(he: AppSizes.s20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w),
                child: CustomOutlineButton(
                  onTap: () {
                    //TODO
                  },
                  width: AppValues.deviceWidth * 0.9,
                  height: AppValues.deviceHeight * 0.06,
                  bgColor: AppColors.secondaryDarkGrey,
                  borderColor: AppColors.accentDarkYellow,
                  textColor: AppColors.white,
                  title: 'Send Code',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
