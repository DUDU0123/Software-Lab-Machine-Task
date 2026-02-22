import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/forgot_password/forgot_password_page.dart';
import 'package:machine_task_app/view/screens/authentication/register/pages/register_page.dart';
import 'package:machine_task_app/view/screens/authentication/verify_otp/verify_otp_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/social_login_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AuthPageTitleWidget(text: "Welcome back!",),
                  AppConstraints.kHeight24,
                  AuthPageSubTitleWidget(
                    firstText: "New here? ",
                    secondText: "Create account",
                    onTap: () {
                      Get.to(()=> RegisterPage());
                    },
                  ),
                AppConstraints.kHeight72,
                AuthTextFieldWidget(
                  controller: emailController,
                  hintText: "Email Address",
                  prefixIcon: SvgPicture.asset(AppAssets.emailIcon,height: 15.h, width: 15.w,),
                ),
                AppConstraints.kHeight24,
                AuthTextFieldWidget(
                  controller: passwordController,
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
                OrLoginWithText(),
                AppConstraints.kHeight32,
                SocialLoginIcons()
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

