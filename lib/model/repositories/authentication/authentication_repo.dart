import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
  }) {
    try {
      //post
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
  }) {
    try {
      //post
    } catch (e) {
      debugPrint("Exception on Register: ${e.toString()}");
    }
  }

  forgotPassword({
    required String mobileNumber,
  }) {
    try {
      //post
    } catch (e) {
      debugPrint("Exception on Forgot Password: ${e.toString()}");
    }
  }

  verifyOtp({required String otp}) {
    try {
      //post
    } catch (e) {
      debugPrint("Exception on Verify OTP: ${e.toString()}");
    }
  }

  resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) {
    try {
      //post
    } catch (e) {
      debugPrint("Exception on Reset Password: ${e.toString()}");
    }
  }
}