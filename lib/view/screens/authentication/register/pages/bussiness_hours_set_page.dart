import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/all_done_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/continue_and_login_button_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/day_selector_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/time_slots_widget.dart';
import 'package:machine_task_app/view/widgets/common/common_grey_small_text_widget.dart';
class BussinessHoursSetPage extends StatefulWidget {
  const BussinessHoursSetPage({super.key});

  @override
  State<BussinessHoursSetPage> createState() => _BussinessHoursSetPageState();
}

class _BussinessHoursSetPageState extends State<BussinessHoursSetPage> {
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
          child: ContinueAndLoginButtonWidget(
            isBackButtonOnLeft: true,
            buttonName: "Continue",
            onPressed: () {
              Get.offAll(()=> AllDonePage());
            },
          ),
        ),
      ),
    );
  }
}

