import 'package:machine_task_app/controller/authentication_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/continue_and_login_button_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/day_selector_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/time_slots_widget.dart';
import 'package:machine_task_app/view/widgets/common/common_grey_small_text_widget.dart';
class BussinessHoursSetPage extends StatelessWidget {
  const BussinessHoursSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 90.h,
               left: 0,
                right: 0,
                 bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonSmallTextWidget(text: "Signup 4 of 4",),
                      AppConstraints.kHeight4,
                      AuthPageTitleWidget(text: "Business Hours",),
                      AppConstraints.kHeight24,
                      CommonSmallTextWidget(
                        text: "Choose the hours your farm is open for pickups.\nThis will allow customers to order deliveries.",
                        fontSize: 12.sp,
                      ),
                      AppConstraints.kHeight24,
                      DaySelectorWidget(),
                      AppConstraints.kHeight20,
                      TimeSlotsWidget()
                    ],
                  ),
                ),
              ),
            ),
            FarmerEatsTextWidget(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: GetBuilder<AuthenticationController>(
            builder: (authenticationController) {
              return ContinueAndLoginButtonWidget(
                isButtonLoading: authenticationController.isRegisterationCompleteLoading,
                isBackButtonOnLeft: true,
                buttonName: "Continue",
                onPressed: () {
                  if (Get.find<AuthenticationController>().selectedDays.isNotEmpty && Get.find<AuthenticationController>().selectedSlots.isNotEmpty) {
                    Get.find<AuthenticationController>().registerUser();
                  } else {
                    AppCommonMethods.commonSnackbar(title: "Error", message: "Please select at least one day and time slot.");
                  }
                },
              );
            }
          ),
        ),
      ),
    );
  }
}

