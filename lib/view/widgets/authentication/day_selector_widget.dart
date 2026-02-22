import 'package:machine_task_app/controller/authentication_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';

class DaySelectorWidget extends StatelessWidget {
  const DaySelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
      builder: (authenticationController) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(authenticationController.days.length, (index) {
            final bool isSelected = authenticationController.selectedDays.contains(index);
            return GestureDetector(
              onTap: () {
                  if (isSelected) {
                    authenticationController.updateSelectedDays(index: index);
                  } else {
                    authenticationController.updateSelectedDays(index: index);
                  }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 6.5.h, horizontal: 11.5.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.kAppPrimaryColor
                      : AppColors.kWhite,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.kAppPrimaryColor
                        : const Color(0xFFE0E0E0),
                    width: 1.5,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.kAppPrimaryColor,
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  authenticationController.days[index],
                  style: AppCommonMethods.commonTextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppAssets.beVietnameProRegular,
                    color: isSelected ? Colors.white : const Color(0xFF666666),
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
