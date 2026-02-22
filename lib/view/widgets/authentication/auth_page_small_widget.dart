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
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      ),
    );
  }
}

class AuthPageSubTitleWidget extends StatelessWidget {
  const AuthPageSubTitleWidget({
    super.key, required this.firstText, required this.secondText,
  });
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return RichText(
    text: TextSpan(
      text: 'New here? ',
      style: AppCommonMethods.commonTextStyle(
        color: AppColors.kGrey,
        fontFamily: AppAssets.beVietnameProMedium,
        fontSize: 14.sp,
      ),
      children: [
        TextSpan(
          text: 'Create account',
          style: AppCommonMethods.commonTextStyle(
            color: AppColors.kAppPrimaryColor,
            fontFamily: AppAssets.beVietnameProMedium,
            fontSize: 14.sp,
          ),
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
      fontFamily: AppAssets.beVietnameProMedium,
      fontSize: 32.sp,
    ),);
  }
}