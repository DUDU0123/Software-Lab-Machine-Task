import 'package:flutter/gestures.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/widgets/common/common_button_widget.dart';

class AuthPageLongButtonWidget extends StatelessWidget {
  const AuthPageLongButtonWidget({
    super.key, required this.buttonText, this.onPressed,
  });
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity ,
      child: CommonButtonWidget(
        onPressed: onPressed,
        btnText: buttonText,
        buttonColor: AppColors.kAppPrimaryColor,
        btnTextColor: AppColors.kWhite,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      ),
    );
  }
}

class AuthPageSubTitleWidget extends StatelessWidget {
  const AuthPageSubTitleWidget({
    super.key, required this.firstText, required this.secondText, this.onTap,
  });
  final String firstText;
  final String secondText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
    text: TextSpan(
      text:"${firstText}  ", // to give space after first text given like this
      style: AppCommonMethods.commonTextStyle(
        color: AppColors.kGrey,
        fontFamily: AppAssets.beVietnameProMedium,
        fontSize: 14.sp,
      ),
      children: [
        TextSpan(
          text: secondText,
          style: AppCommonMethods.commonTextStyle(
            color: AppColors.kAppPrimaryColor,
            fontFamily: AppAssets.beVietnameProMedium,
            fontSize: 14.sp,
          ),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ],
    ),
                  );
  }
}

class AuthPageTitleWidget extends StatelessWidget {
  const AuthPageTitleWidget({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppCommonMethods.commonTextStyle(
      fontFamily: AppAssets.beVietnameProBold,
      fontSize: 32.sp,
    ),);
  }
}

class OrLoginWithText extends StatelessWidget {
  const OrLoginWithText({
    super.key, this.text = "Or login with",
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
      textAlign: TextAlign.center,
      style: AppCommonMethods.commonTextStyle(
        fontFamily: AppAssets.beVietnameProMedium,
        fontSize: 10.sp,
        color: AppColors.kGrey
      ),),
    );
  }
}