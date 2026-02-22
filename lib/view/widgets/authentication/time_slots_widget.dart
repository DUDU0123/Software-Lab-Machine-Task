import 'package:machine_task_app/controller/authentication_controller.dart';
import '../../../core/constants/app_imports.dart';

class TimeSlotsWidget extends StatelessWidget {
  const TimeSlotsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (authenticationController) {
        return Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: List.generate(authenticationController.timeSlots.length, (index) {
            final bool isSelected = authenticationController.selectedSlots.contains(index);
            return GestureDetector(
              onTap: () {
                authenticationController.updateSelectedSlots(index: index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: (AppConstraints.kScreenWidth - 60.w - 12.w) / 2,
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.kAppSecondaryColor // yellow highlight
                      : AppColors.kGrey.withAlpha(60),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.kAppSecondaryColor
                        : AppColors.kWhite,
                    width: 1.5,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.kAppPrimaryColor.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  authenticationController.timeSlots[index],
                  style: AppCommonMethods.commonTextStyle(
                    fontSize: 13.sp,
                    fontFamily: AppAssets.beVietnameProRegular,
                    color: AppColors.kBlack
                  ),
                ),
              ),
            );
          }),
        );
      }
    );
  }
}