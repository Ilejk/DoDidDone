import 'package:todo_app/common/export/export.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  Country country = COUNTRYBASE;

  sendCodeToUser() {
    if (phoneController.text.isEmpty) {
      return showAlertDialog(
        context: context,
        message: AppStrings.providePhoneNumber,
      );
    } else if (phoneController.text.length < 8) {
      return showAlertDialog(
        context: context,
        message: AppStrings.phoneNumberIsTooShort,
      );
    }

    ref.read(authControllerProvider).sendSMS(
          context: context,
          phoneNumber: '+${country.phoneCode}${phoneController.text}',
        );
  }

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
                  suffixIconColor: AppColors.lightOrange,
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
                                  color: AppColors.lightOrange,
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
                            setState(() {
                              country = code;
                            });
                          },
                        );
                      },
                      child: ReusableTextWidget(
                        textAlign: TextAlign.left,
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
                        setState(() {
                          phoneController.text = AppConsts.empty;
                        });
                      },
                      child: const Icon(Icons.delete),
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
                    sendCodeToUser();
                  },
                  width: AppValues.deviceWidth * 0.9,
                  height: AppValues.deviceHeight * 0.06,
                  bgColor: AppColors.secondaryDarkGrey,
                  borderColor: AppColors.lightOrange,
                  textColor: AppColors.white,
                  title: AppStrings.loginPageSend,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
