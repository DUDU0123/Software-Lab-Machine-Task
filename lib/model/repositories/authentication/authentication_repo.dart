import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:machine_task_app/core/constants/backend_constants.dart';

class AuthenticationRepo {
  final Dio dio;
  AuthenticationRepo({required this.dio});
  loginUser({
    required String email,
    required String password,
    required String role,
    required String deviceToken,
    required String type,
    required String socialId,
  }) async {
    try {
      final response = await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.loginEndpoint}",
        data: {
          "email": email,
          "password": password,
          "role": role,
          "device_token": deviceToken,
          "type": type,
          "social_id": socialId,
        },
      );
    } catch (e) {
      debugPrint("Exception on Login: ${e.toString()}");
    }
  }

  registerUser({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String role,
    required String businessName,
    required String informalName,
    required String address,
    required String city,
    required String state,
    required int zipCode,
    required String registrationProof,
    required Map<String, List<String>> businessHours,
    required String deviceToken,
    required String type,
    required String socialId,
  }) async {
    try {
      final response = await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.registerEndpoint}",
        data: {}
      );
    } catch (e) {
      debugPrint("Exception on Register: ${e.toString()}");
    }
  }

  forgotPassword({
    required String mobileNumber,
  }) async {
    try {
      final response = await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.forgotPasswordEndpoint}",
        data: {
          "mobile": mobileNumber,
        },
      );
    } catch (e) {
      debugPrint("Exception on Forgot Password: ${e.toString()}");
    }
  }

  verifyOtp({required String otp}) async {
    try {
      await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.verifyOtpEndpoint}",
        data: {
          "otp": otp,
        },
      );
    } catch (e) {
      debugPrint("Exception on Verify OTP: ${e.toString()}");
    }
  }

  resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.resetPasswordEndpoint}",
        data: {
          "token": token,
          "password": newPassword,
          "cpassword": confirmPassword,
        },
      );
    } catch (e) {
      debugPrint("Exception on Reset Password: ${e.toString()}");
    }
  }
}