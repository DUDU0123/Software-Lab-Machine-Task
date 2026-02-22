import 'package:machine_task_app/core/constants/app_imports.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    super.key, required this.btnText, required this.buttonColor, required this.btnTextColor, this.padding, this.fontSize, this.fontWeight, this.fontFamily, this.onPressed,
  });

  final String btnText;
  final Color buttonColor;
  final Color btnTextColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: padding,
        disabledBackgroundColor: buttonColor,
      ),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: AppCommonMethods.commonTextStyle(
            fontSize: fontSize ?? 18,
            fontFamily: fontFamily ?? AppAssets.beVietnameProMedium,
            color: btnTextColor,
          ),
        ),
      );
  }
}
