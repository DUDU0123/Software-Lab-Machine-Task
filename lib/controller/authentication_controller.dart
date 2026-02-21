import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_task_app/model/repositories/authentication/authentication_repo.dart';

class AuthenticationController extends GetxController{
  final AuthenticationRepo authenticationRepo;

  AuthenticationController({required this.authenticationRepo});
  Future<void> loginUser({
    required String email,
    required String password,
    required String role,
    required String deviceToken,
    required String type,
    required String socialId,
  }) async {
    try {
      //call repo
      await authenticationRepo.loginUser(
        email: email,
        password: password,
        role: role,
        deviceToken: deviceToken,
        type: type,
        socialId: socialId,
      );
    } catch (e) {
      debugPrint("Exception on Login: ${e.toString()}");
    }
  }

  void registerUser() {
    try {
      //call repo
      // await authenticationRepo.registerUser(
      //   fullName: fullName,
      //   email: email,
      //   phone: phone,
      //   password: password,
      //   role: role,
      //   businessName: businessName,
      //   informalName: informalName,
      //   address: address,
      //   city: city,
      //   state: state,
      //   zipCode: zipCode,
      //   registrationProof: registrationProof,
      //   businessHours: businessHours,
      //   deviceToken: deviceToken,
      //   type: type, 
      //   socialId: socialId,
      // );
    } catch (e) {
      debugPrint("Exception on Register: ${e.toString()}");
    }
  }

  Future<void> forgotPassword({required String mobileNumber}) async {
    try {
      await authenticationRepo.forgotPassword(mobileNumber: mobileNumber);
    } catch (e) {
      debugPrint("Exception on Forgot Password: ${e.toString()}");
    }
  }

  Future<void> verifyOtp({required String otp}) async{
    try {
      await authenticationRepo.verifyOtp(otp: otp);
    } catch (e) {
      debugPrint("Exception on Verify OTP: ${e.toString()}");
    }
  }

  Future<void> resetPassword({required String token, required String newPassword, required String confirmPassword}) async {
    try {
      await authenticationRepo.resetPassword(token: token, newPassword: newPassword, confirmPassword: confirmPassword);
    } catch (e) {
      debugPrint("Exception on Reset Password: ${e.toString()}");
    }
  }
}