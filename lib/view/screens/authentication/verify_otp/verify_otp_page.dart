import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/login/login_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

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
                AuthTextFieldWidget(
                  hintText: "Password",
                  prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                ),
                AppConstraints.kHeight24,
                AuthTextFieldWidget(
                  hintText: "Confirm New Password",
                  prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                ),
                AppConstraints.kHeight32,
                AuthPageLongButtonWidget(
                  buttonText: "Submit",
                  onPressed: () {
                    
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
          FarmerEatsTextWidget()
        ],
      ),
    );
  }
}

