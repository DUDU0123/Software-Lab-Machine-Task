import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/forgot_password/forgot_password_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/social_login_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthPageTitleWidget(text: "Welcome back!",),
                AppConstraints.kHeight24,
                AuthPageSubTitleWidget(
                  firstText: "New here? ",
                  secondText: "Create account",
                ),
              AppConstraints.kHeight72,
              AuthTextFieldWidget(
                hintText: "Email Address",
                prefixIcon: SvgPicture.asset(AppAssets.emailIcon,height: 15.h, width: 15.w,),
              ),
              AppConstraints.kHeight24,
              AuthTextFieldWidget(
                hintText: "Password",
                prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Forgot Password
                      Get.to(()=> ForgotPasswordPage());
                    },
                    child: Text("Forgot?", style: AppCommonMethods.commonTextStyle(
                      color: AppColors.kAppPrimaryColor,
                      fontFamily: AppAssets.beVietnameProRegular,
                      fontSize: 14.sp,
                    ),),
                  ),
                ),
              ),
              AppConstraints.kHeight32,
              AuthPageLongButtonWidget(
                buttonText: "Login",
                onPressed: () {
                  
                },
              ),
              AppConstraints.kHeight32,
              Center(
                child: Text("Or login with",
                textAlign: TextAlign.center,
                style: AppCommonMethods.commonTextStyle(
                  fontFamily: AppAssets.beVietnameProMedium,
                  fontSize: 10.sp,
                ),),
              ),
              AppConstraints.kHeight32,
              SocialLoginIcons()
              ],
            ),
          ),
          FarmerEatsTextWidget()
        ],
      ),
    );
  }
}

