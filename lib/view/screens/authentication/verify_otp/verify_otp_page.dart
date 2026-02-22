import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/login/login_page.dart';
import 'package:machine_task_app/view/screens/authentication/reset_password/reset_password_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_task_app/view/widgets/common/common_text_form_field_widget.dart';
class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final List<TextEditingController> otpControllers = List.generate(5, (_) => TextEditingController());
  String getOtp() {
    return otpControllers.map((c) => c.text).join();
  }

  @override
  void dispose() {
    for (final c in otpControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 120.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AuthPageTitleWidget(text: "Verify OTP",),
                    AppConstraints.kHeight24,
                    AuthPageSubTitleWidget(
                      firstText: "Remember your pasword?",
                      secondText: "Login?",
                      onTap: () {
                        Get.to(()=> LoginPage());
                      },
                    ),
                  AppConstraints.kHeight72,
                  // OTP Input Row - add this after AppConstraints.kHeight72
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return Container(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEECEA),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: CommonTextFormFieldWidget(
                          controller: otpControllers[index],
                          cursorColor: AppColors.kBlack,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: AppCommonMethods.commonTextStyle(
                            fontFamily: AppAssets.beVietnameProMedium,
                            fontSize: 20.sp,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 4) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  AppConstraints.kHeight32,
                  AuthPageLongButtonWidget(
                    buttonText: "Submit",
                    onPressed: () {
                      final otp = getOtp();
                      if (otp.length == 5 && otp.isNotEmpty) {
                        Get.to(()=> ResetPasswordPage());
                      } else {
                        AppCommonMethods.commonSnackbar(title: "Error", message: "Please enter the correct OTP.");
                      }
                    },
                  ),
                  Center(
                    child: TextButton(onPressed: () {
                      // resend code
                    }, child: Text(
                      "Resend Code",
                      style: AppCommonMethods.commonTextStyle(
                        fontFamily: AppAssets.beVietnameProMedium,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline,
                      ),
                    )),
                  ),
                  ],
                ),
              ),
            ),
          ),
          FarmerEatsTextWidget()
        ],
      ),
    );
  }
}

