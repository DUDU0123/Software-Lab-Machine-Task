import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_task_app/model/repositories/authentication/authentication_repo.dart';
import 'package:machine_task_app/utils/app_common_methods.dart';
import 'package:machine_task_app/view/screens/authentication/all_done_page.dart';

class AuthenticationController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController informalNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();


  final AuthenticationRepo authenticationRepo;
  String? selectedState;
  bool isRegisterationCompleteLoading = false;
  bool isLoginProcessLoading = false;

  AuthenticationController({required this.authenticationRepo});
  final List<String> days = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];
  final List<String> apiDays = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
  Set<int> selectedDays = {};
  Set<int> selectedSlots = {};
  String registrationProofFileName = '';

  final List<String> timeSlots = [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm',
  ];

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    reEnterPasswordController.dispose();
    businessNameController.dispose();
    informalNameController.dispose();
    cityController.dispose();
    streetAddressController.dispose();
    zipCodeController.dispose();
  }

  void updateSelectedDays({required int index}) {
    if (selectedDays.contains(index)) {
      selectedDays.remove(index);
    } else {
      selectedDays.add(index);
    }
    update();
  }

  void setRegistrationProofFileName({required String fileName}) {
    registrationProofFileName = fileName;
    update();
  }

  void updateSelectedSlots({required int index}) {
    if (selectedSlots.contains(index)) {
      selectedSlots.remove(index);
    } else {
      selectedSlots.add(index);
    }
    update();
  }

 void setSelectedState({required String state}) {
  selectedState = state;
  update();
 }
  Future<void> loginUser({
    required String email,
    required String password,
    required String role,
    required String deviceToken,
    required String type,
    required String socialId,
  }) async {
    try {
      isLoginProcessLoading = true;
      update();
      if (email.isNotEmpty && password.isNotEmpty && AppCommonMethods.emailRegex.hasMatch(email)) {
        final bool value = await authenticationRepo.loginUser(
          email: email,
          password: password,
          role: "farmer",
          deviceToken: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
          type: "manual",
          socialId: "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
        );
        if (value) {
          isLoginProcessLoading = false;
          update();
          AppCommonMethods.commonSnackbar(title: "Success", message: "Login Success");
        } else {
          isLoginProcessLoading = false;
          update();
          AppCommonMethods.commonSnackbar(title: "Error", message: "Something went wrong");
        }
      } else {
        isLoginProcessLoading = false;
        update();
        AppCommonMethods.commonSnackbar(title: "Error", message: "Please enter valid email and password.");
        return;
      }
    } catch (e) {
      isLoginProcessLoading = false;
      update();
      debugPrint("Exception on Login: ${e.toString()}");
      AppCommonMethods.commonSnackbar(title: "Error", message: "Something went wrong");
      return;
    }
  }

  Future<void> registerUser() async {
    try {
      isRegisterationCompleteLoading = true;
      update();
      final Map<String, List<String>> businessHours = {};

      for (int dayIndex in selectedDays) {
        businessHours[apiDays[dayIndex]] =
            selectedSlots.map((slotIndex) => timeSlots[slotIndex]).toList();
      }
      //call repo
      final bool value = await authenticationRepo.registerUser(
        fullName: fullNameController.text,
        email: emailController.text,
        phone: phoneNumberController.text,
        password: passwordController.text,
        role: "farmer",
        businessName: businessNameController.text,
        informalName: informalNameController.text,
        address: streetAddressController.text,
        city: cityController.text,
        state: selectedState!,
        zipCode: int.tryParse(zipCodeController.text) ?? 0,
        registrationProof: registrationProofFileName,
        businessHours: businessHours,
      );
      if (value == true) {
        isRegisterationCompleteLoading = false;
        update();
        Get.offAll(() => const AllDonePage());
      } else {
        isRegisterationCompleteLoading = false;
        update();
        AppCommonMethods.commonSnackbar(title: "Error", message: "Registration failed. Please try again.");
        return;
      }
    } catch (e) {
      isRegisterationCompleteLoading = false;
      update();
      debugPrint("Exception on Register: ${e.toString()}");
      AppCommonMethods.commonSnackbar(title: "Error", message: "Something went wrong");
    }
  }

  Future<void> forgotPassword({required String mobileNumber}) async {
    try {
      final value = await authenticationRepo.forgotPassword(mobileNumber: mobileNumber);
    } catch (e) {
      debugPrint("Exception on Forgot Password: ${e.toString()}");
    }
  }

  Future<void> verifyOtp({required String otp}) async{
    try {
      final value = await authenticationRepo.verifyOtp(otp: otp);
    } catch (e) {
      debugPrint("Exception on Verify OTP: ${e.toString()}");
    }
  }

  Future<void> resetPassword({required String token, required String newPassword, required String confirmPassword}) async {
    try {
      final value = await authenticationRepo.resetPassword(token: token, newPassword: newPassword, confirmPassword: confirmPassword);
    } catch (e) {
      debugPrint("Exception on Reset Password: ${e.toString()}");
    }
  }
}