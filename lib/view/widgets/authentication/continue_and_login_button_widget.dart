import 'package:flutter_svg/svg.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/login/login_page.dart';
import 'package:machine_task_app/view/widgets/common/common_button_widget.dart';

class ContinueAndLoginButtonWidget extends StatelessWidget {
  const ContinueAndLoginButtonWidget({
    super.key, this.onPressed, required this.buttonName, required this.isBackButtonOnLeft,
  });
  final void Function()? onPressed;
  final String buttonName;
  final bool isBackButtonOnLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       !isBackButtonOnLeft ? TextButton(onPressed: () {
          Get.offAll(()=> LoginPage());
        }, child: Text("Login", style: AppCommonMethods.commonTextStyle(
          decoration: TextDecoration.underline,
          
        ),)) : GestureDetector(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(AppAssets.leftArrowIcon, height: 11.67.h, width: 6.67.w,)),
        CommonButtonWidget(
          onPressed: onPressed,
          btnText: buttonName,
          buttonColor: AppColors.kAppPrimaryColor,
          btnTextColor: AppColors.kWhite,
          padding: EdgeInsets.symmetric(horizontal: 46.06.w, vertical: 13.h),
        ),
      ],
    );
  }
}
