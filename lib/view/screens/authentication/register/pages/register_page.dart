import 'package:machine_task_app/controller/authentication_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/register/pages/farm_info_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/continue_and_login_button_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/social_login_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_task_app/view/widgets/common/common_grey_small_text_widget.dart';
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final AuthenticationController authController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 90.h,
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
                      CommonSmallTextWidget(text: "Signup 1 of 4",),
                      AppConstraints.kHeight4,
                      AuthPageTitleWidget(text: "Welcome!",),
                      AppConstraints.kHeight40,
                      SocialLoginIcons(),
                      AppConstraints.kHeight32,
                      OrLoginWithText(text: "or signup with",),
                      AppConstraints.kHeight32,
                      AuthTextFieldWidget(
                        controller: authController.fullNameController,
                        hintText: "Full Name",
                        prefixIcon: SvgPicture.asset(AppAssets.personIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        keyboardType: TextInputType.emailAddress,
                        controller: authController.emailController,
                        hintText: "Email Address",
                        prefixIcon: SvgPicture.asset(AppAssets.emailIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: authController.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        hintText: "Phone Number",
                        prefixIcon: SvgPicture.asset(AppAssets.phoneIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: authController.passwordController,
                        hintText: "Password",
                        prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: authController.reEnterPasswordController,
                        hintText: "Re-enter Password",
                        prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight32,
                      ContinueAndLoginButtonWidget(
                        isBackButtonOnLeft: false,
                        buttonName: "Continue",
                        onPressed: () {
                          if (authController.emailController.text.isNotEmpty &&
                              authController.passwordController.text.isNotEmpty &&
                              authController.fullNameController.text.isNotEmpty &&
                              authController.phoneNumberController.text.isNotEmpty &&
                              authController.reEnterPasswordController.text.isNotEmpty && AppCommonMethods.emailRegex.hasMatch(authController.emailController.text) &&
                              authController.passwordController.text ==authController. reEnterPasswordController.text) {
                            Get.to(()=> FarmInfoPage());
                          } else {
                            AppCommonMethods.commonSnackbar(title: "Error", message: "Please fill all the fields correctly.");
                          }
                        },
                      ),
                      AppConstraints.kHeight32,
                    ],
                  ),
                ),
              ),
            ),
            FarmerEatsTextWidget(),
          ],
        ),
      ),
    );
  }
}


