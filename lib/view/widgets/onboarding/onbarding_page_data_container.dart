import 'package:machine_task_app/controller/onboarding_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/login/login_page.dart';
import 'package:machine_task_app/view/widgets/common/common_button_widget.dart';


class OnboardingPageDataContainer extends StatelessWidget {
  const OnboardingPageDataContainer({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 31.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                data['title']!,
                textAlign: TextAlign.center,
                style: AppCommonMethods.commonTextStyle(
                  fontSize: 24.sp,
                  fontFamily: AppAssets.beVietnameProBold
                ),
              ),
              AppConstraints.kHeight35,
              Text(
                data['description']!,
                textAlign: TextAlign.center,
                style: AppCommonMethods.commonTextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          AppConstraints.kHeight27,
          /// Dots
          GetBuilder<OnboardingController>(
            builder: (onboardingController) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  AppCommonMethods.onboardingData.length,
                  (dotIndex) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: onboardingController.currentPageIndex == dotIndex ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: onboardingController.currentPageIndex == dotIndex
                            ? Colors.black
                            : Colors.black26,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              );
            }
          ),
          AppConstraints.kHeight27,
          /// Buttons
          CommonButtonWidget(
            btnText: "Join the movement!",
            buttonColor: data['color'],
            fontSize: 18,
            fontFamily: AppAssets.beVietnameProMedium,
            btnTextColor: AppColors.kWhite,
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 17.h),
          ),
    
            TextButton(
              onPressed: () {
                Get.offUntil(MaterialPageRoute(builder: (context) {
                  return LoginPage();
                },), (route) => false,);
            }, child: Text(
              "Login",
              style: AppCommonMethods.commonTextStyle(
                decoration: TextDecoration.underline,
                fontFamily: AppAssets.beVietnameProMedium,
                fontSize: 14.sp,
              ),
            )),
        ],
      ),
    );
  }
}

