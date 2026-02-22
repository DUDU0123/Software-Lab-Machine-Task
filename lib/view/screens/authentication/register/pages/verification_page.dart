import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_task_app/controller/authentication_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/register/pages/bussiness_hours_set_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/continue_and_login_button_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:machine_task_app/view/widgets/common/common_grey_small_text_widget.dart';
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

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
                      CommonSmallTextWidget(text: "Signup 3 of 4",),
                      AppConstraints.kHeight4,
                      AuthPageTitleWidget(text: "Verification",),
                      AppConstraints.kHeight24,
                      CommonSmallTextWidget(
                        text: "Attached proof of Department of Agriculture\nregistrations i.e. Florida Fresh, USDA Approved,\nUSDA Organic",
                        fontSize: 12.sp,
                      ),
                      AppConstraints.kHeight57,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Attach proof of registration", style: AppCommonMethods.commonTextStyle(
                            color: AppColors.kBlack,
                            fontFamily: AppAssets.beVietnameProRegular,
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline
                          ),),
                          GestureDetector(
                            onTap: () async {
                              await AppCommonMethods.pickFile();
                            },
                            child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: AppColors.kAppPrimaryColor,
                              child: SvgPicture.asset(AppAssets.cameraIcon, height: 14.33.h, width: 23.96.w,),
                            ),
                          )
                        ],
                      ),
                        AppConstraints.kHeight40,
                        GetBuilder<AuthenticationController>(
                          builder: (authenticationController) {
                            if(authenticationController.registrationProofFileName.isEmpty) {
                              return const SizedBox.shrink();
                            } else {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.kGrey.withAlpha(60),
                                borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0),
                                title: Text(authenticationController.registrationProofFileName, style: AppCommonMethods.commonTextStyle(
                                  color: AppColors.kBlack,
                                  fontFamily: AppAssets.beVietnameProRegular,
                                  fontSize: 14.sp,
                                ),),
                                trailing: GestureDetector(
                                  onTap: () {
                                    authenticationController.setRegistrationProofFileName(fileName: '');
                                  },
                                  child: Icon(Icons.close, size: 18.sp, color: AppColors.kGrey,)),
                              ),
                            );
                            }
                          }
                        ),
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
              Get.to(()=> BussinessHoursSetPage());
            },
          ),
        ),
      ),
    );
  }
}



