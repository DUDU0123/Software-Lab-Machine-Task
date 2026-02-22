import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/register/pages/farm_info_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/continue_and_login_button_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/social_login_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_task_app/view/widgets/common/common_grey_small_text_widget.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    reEnterPasswordController.dispose();
    super.dispose();
  }
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
                        controller: fullNameController,
                        hintText: "Full Name",
                        prefixIcon: SvgPicture.asset(AppAssets.personIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: emailController,
                        hintText: "Email Address",
                        prefixIcon: SvgPicture.asset(AppAssets.emailIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: phoneNumberController,
                        hintText: "Phone Number",
                        prefixIcon: SvgPicture.asset(AppAssets.phoneIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: passwordController,
                        hintText: "Password",
                        prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: reEnterPasswordController,
                        hintText: "Re-enter Password",
                        prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight32,
                      ContinueAndLoginButtonWidget(
                        isBackButtonOnLeft: false,
                        buttonName: "Continue",
                        onPressed: () {
                          Get.to(()=> FarmInfoPage());
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


