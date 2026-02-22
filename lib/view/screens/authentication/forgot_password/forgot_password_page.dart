import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
                AuthPageTitleWidget(text: "Forgot Password?",),
                AppConstraints.kHeight24,
                AuthPageSubTitleWidget(
                  firstText: "Remember your pasword?",
                  secondText: "Login?",
                ),
              AppConstraints.kHeight72,
              AuthTextFieldWidget(
                hintText: "Phone Number",
                prefixIcon: SvgPicture.asset(AppAssets.phoneIcon,height: 15.h, width: 15.w,),
              ),
              AppConstraints.kHeight32,
              AuthPageLongButtonWidget(
                buttonText: "Send Code",
                onPressed: () {
                  
                },
              ),
              ],
            ),
          ),
          FarmerEatsTextWidget()
        ],
      ),
    );
  }
}

