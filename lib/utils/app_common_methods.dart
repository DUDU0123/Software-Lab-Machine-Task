import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_task_app/utils/app_colors.dart';

class AppCommonMethods {
  static TextStyle commonTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    TextOverflow? overflow,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
      color: color ?? AppColors.kBlack,
      fontSize: fontSize ?? 16.sp,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
      height: height,
      shadows: shadows,
    );
  }
}
