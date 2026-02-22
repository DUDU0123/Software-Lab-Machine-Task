import 'package:machine_task_app/core/constants/app_imports.dart';

class FarmerEatsTextWidget extends StatelessWidget {
  const FarmerEatsTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 36.h, left: 30.w,
      child: Text("FarmerEats", style: AppCommonMethods.commonTextStyle(
        fontSize: 14.sp,
        fontFamily: AppAssets.beVietnameProRegular,
      ),),
    );
  }
}