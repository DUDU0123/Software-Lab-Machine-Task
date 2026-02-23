import 'package:machine_task_app/controller/authentication_controller.dart';
import 'package:machine_task_app/core/constants/app_imports.dart';
import 'package:machine_task_app/view/screens/authentication/register/pages/verification_page.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_page_small_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/auth_text_field_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/continue_and_login_button_widget.dart';
import 'package:machine_task_app/view/widgets/authentication/farmer_eats_text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_task_app/view/widgets/common/common_grey_small_text_widget.dart';
class FarmInfoPage extends StatelessWidget {
  FarmInfoPage({super.key});

  final authController = Get.find<AuthenticationController>();

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
                      CommonSmallTextWidget(text: "Signup 2 of 4",),
                      AppConstraints.kHeight4,
                      AuthPageTitleWidget(text: "Farm Info",),
                      AppConstraints.kHeight40,
                      AuthTextFieldWidget(
                        controller: authController.businessNameController,
                        hintText: "Business Name",
                        prefixIcon: SvgPicture.asset(AppAssets.personIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: authController.informalNameController,
                        hintText: "Informal Name",
                        prefixIcon: SvgPicture.asset(AppAssets.emailIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: authController.streetAddressController,
                        hintText: "Street Address",
                        prefixIcon: SvgPicture.asset(AppAssets.phoneIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      AuthTextFieldWidget(
                        controller: authController.cityController,
                        hintText: "City",
                        prefixIcon: SvgPicture.asset(AppAssets.passwordLockIcon,height: 15.h, width: 15.w,),
                      ),
                      AppConstraints.kHeight24,
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: Get.find<AuthenticationController>().selectedState,
                              hint: const Text("State"),
                              items: AppCommonMethods.indianStates.map((state) {
                                return DropdownMenuItem(
                                  value: state,
                                  child: Text(state),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  Get.find<AuthenticationController>().setSelectedState(state: value);
                                }
                              },
                              decoration: InputDecoration(
                                fillColor: AppColors.kGrey.withAlpha(60),
                                filled: true,
                                contentPadding: EdgeInsets.only(
                                  bottom: 5.h, top: 5.h, left: 12.w, right: 30.w
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: AppColors.kTransparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: AppColors.kTransparent),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: AppColors.kTransparent),
                                ),
                              ),
                            ),
                          ),
                          AppConstraints.kWidth16,
                          Expanded(
                            child: AuthTextFieldWidget(
                              keyboardType: TextInputType.phone,
                              controller: authController.zipCodeController,
                              hintText: "Zipcode",
                            ),
                          ),
                        ],
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
              if (authController.businessNameController.text.isNotEmpty &&
                  authController.zipCodeController.text.isNotEmpty &&
                  authController.informalNameController.text.isNotEmpty &&
                  authController.streetAddressController.text.isNotEmpty &&
                  authController.cityController.text.isNotEmpty &&
                  Get.find<AuthenticationController>().selectedState != null) {
                    Get.to(()=> VerificationPage());
                  } else {
                    AppCommonMethods.commonSnackbar(title: "Error", message: "Please fill all the fields correctly.");
                  }
            },
          ),
        ),
      ),
    );
  }
}

