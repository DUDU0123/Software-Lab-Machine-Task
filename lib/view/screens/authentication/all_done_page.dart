import 'package:flutter_svg/svg.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/login/login_page.dart';
import 'package:machine_task_app/view/widgets/common/common_button_widget.dart';

class AllDonePage extends StatelessWidget {
  const AllDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 31.7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.doneTickIcon, width: 120.61.w, height: 80.41.h,),
            AppConstraints.kHeight32,
            Text("You’re all done!", style: AppCommonMethods.commonTextStyle(
              fontFamily: AppAssets.beVietnameProBold,
              fontSize: 32.sp,
            ),),
            AppConstraints.kHeight24,
            Text(
              "Hang tight!  We are currently reviewing your account and\nwill follow up with you in 2-3 business days. In the\nmeantime, you can setup your inventory.",
              textAlign: TextAlign.center,
              style: AppCommonMethods.commonTextStyle(
                fontFamily: AppAssets.beVietnameProRegular,
                fontSize: 10.7.sp,
                color: AppColors.kGrey,
                letterSpacing: 0
              ),),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SizedBox(
          width: double.infinity,
          child: CommonButtonWidget(
            onPressed: () {
              Get.offUntil(MaterialPageRoute(builder: (context) {
                return LoginPage();
              },), (route) => false);
            },
            btnText: "Got it",
            buttonColor: AppColors.kAppPrimaryColor,
            btnTextColor: AppColors.kWhite,
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
        ),
      ),
    );
  }
}