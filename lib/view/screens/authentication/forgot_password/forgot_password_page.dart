import 'package:machine_task_app/controller/authentication_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/login/login_page.dart';
import 'package:machine_task_app/view/screens/authentication/verify_otp/verify_otp_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
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
                  AuthPageTitleWidget(text: "Forgot Password?",),
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
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  hintText: "Phone Number",
                  prefixIcon: SvgPicture.asset(AppAssets.phoneIcon,height: 15.h, width: 15.w,),
                ),
                AppConstraints.kHeight32,
                AuthPageLongButtonWidget(
                  buttonText: "Send Code",
                  onPressed: () {
                    if (phoneNumberController.text.isNotEmpty && phoneNumberController.text.length > 7) {
                      // send code and then navigate to verify otp page
                      Get.find<AuthenticationController>().forgotPassword(mobileNumber: phoneNumberController.text);
                    } else {
                      AppCommonMethods.commonSnackbar(title: "Error", message: "Enter valid phone number");
                    }
                  },
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

