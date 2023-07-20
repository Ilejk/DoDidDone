import 'package:todo_app/common/export/export.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.smsCodeID,
    required this.phoneNumber,
  });

  final String smsCodeID;
  final String phoneNumber;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with SingleTickerProviderStateMixin {
  bool animate = false;
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.stop();
        }
      });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDarkGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(he: AppValues.deviceHeight * 0.1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: LottieBuilder.asset(
                  AppAnimations.otp,
                  controller: _animationController!.view,
                  animate: animate,
                  onLoaded: (composition) {
                    _animationController!.duration = composition.duration;
                    _animationController!.forward();
                  },
                ),
              ),
              HeightSpacer(he: AppSizes.s25.h),
              ReusableTextWidget(
                text: AppStrings.otpPageEnter,
                textStyle: appTextStyle(
                  fontSize: AppFontSizes.fs18,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              HeightSpacer(he: AppSizes.s10.h),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  var isCodeLengthValid = value.length == 6;
                  if (isCodeLengthValid) {
                    //TODO
                  }
                },
                onSubmitted: (value) {
                  var isCodeLengthValid = value.length == 6;
                  if (isCodeLengthValid) {
                    //TODO
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
