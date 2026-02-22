import 'package:flutter_svg/svg.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';

class SocialIconContainerWidget extends StatelessWidget {
  const SocialIconContainerWidget({
    super.key, required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 11.h),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.kGrey.withAlpha(60)),
       ),
       child: SvgPicture.asset(icon, height: 20.h, width: 20.w,),
    );
  }
}
