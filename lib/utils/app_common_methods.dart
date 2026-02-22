import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_task_app/core/constants/app_assets.dart';
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
      fontFamily: fontFamily ?? AppAssets.beVietnameProRegular,
      letterSpacing: letterSpacing,
      decoration: decoration,
      overflow: overflow,
      height: height,
      shadows: shadows,
    );
  }

  // onboarding screen data
  static List<Map<String, dynamic>> onboardingData = [
    {
      'title': 'Quality',
      'description': "Sell your farm fresh products directly to\nconsumers, cutting out the middleman and\nreducing emissions of the global supply chain.",
      'image': AppAssets.onboarding1,
      "color": AppColors.kGreen,
    },
    {
      'title': 'Convenient',
      'description': "Our team of delivery drivers will make sure\nyour orders are picked up on time and\npromptly delivered to your customers.",
      'image': AppAssets.onboarding2,
      "color": AppColors.kAppPrimaryColor,
    },
    {
      'title': 'Local',
      'description': "We love the earth and know you do too! Join us\nin reducing our local carbon footprint one order\nat a time. ",
      'image': AppAssets.onboarding3,
      "color": AppColors.kAppSecondaryColor,
    },
  ];

  static final List<String> indianStates = [
    'AP', // Andhra Pradesh
    'AR', // Arunachal Pradesh
    'AS', // Assam
    'BR', // Bihar
    'CG', // Chhattisgarh
    'GA', // Goa
    'GJ', // Gujarat
    'HR', // Haryana
    'HP', // Himachal Pradesh
    'JH', // Jharkhand
    'KA', // Karnataka
    'KL', // Kerala
    'MP', // Madhya Pradesh
    'MH', // Maharashtra
    'MN', // Manipur
    'ML', // Meghalaya
    'MZ', // Mizoram
    'NL', // Nagaland
    'OD', // Odisha
    'PB', // Punjab
    'RJ', // Rajasthan
    'SK', // Sikkim
    'TN', // Tamil Nadu
    'TS', // Telangana
    'TR', // Tripura
    'UP', // Uttar Pradesh
    'UK', // Uttarakhand
    'WB', // West Bengal
    ];
}
