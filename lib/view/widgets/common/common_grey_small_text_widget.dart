import 'package:machine_task_app/core/constants/app_imports.dart';

class CommonSmallTextWidget extends StatelessWidget {
  const CommonSmallTextWidget({
    super.key, required this.text, this.fontSize, this.color, this.decoration,
  });
  final String text;
  final double? fontSize;
  final Color? color;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppCommonMethods.commonTextStyle(
        color:  color ?? AppColors.kGrey,
        fontFamily: AppAssets.beVietnameProMedium,
        fontSize: fontSize ?? 14.sp,
        decoration: decoration
      ),
    );
  }
}