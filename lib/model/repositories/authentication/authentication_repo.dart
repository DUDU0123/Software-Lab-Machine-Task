import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:machine_task_app/core/constants/backend_constants.dart';

class AuthenticationRepo {
  final Dio dio;
  AuthenticationRepo({required this.dio});
  Future<bool> loginUser({
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
      if(response.data["success"] == true){
        return true;
      } else {
        throw Exception("Login failed: ${response.data["message"]}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> registerUser({
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
  }) async {
    try {
      final response = await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.registerEndpoint}",
        data: {
          "full_name": fullName,
          "email": email,
          "phone": phone,
          "password": password,
          "role": role,
          "business_name": businessName,
          "informal_name": informalName,
          "address": address,
          "city": city,
          "state": state,
          "zip_code": zipCode,
          "registration_proof": registrationProof,
          "business_hours": businessHours,
          "device_token": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx",
          "type": "manual",
          "social_id": "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx"
        }
      );
      if(response.data["success"] == true){
        response.data["token"];
        return true;
      } else {
        throw Exception("Registration failed: ${response.data["message"]}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> forgotPassword({
    required String mobileNumber,
  }) async {
    try {
      final response = await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.forgotPasswordEndpoint}",
        data: {
          "mobile": mobileNumber,
        },
      );
      if (response.data["success"] == true) {
        return true;
      } else {
        throw Exception(["Something went wrong"]);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> verifyOtp({required String otp}) async {
    try {
      final response = await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.verifyOtpEndpoint}",
        data: {
          "otp": otp,
        },
      );
      if (response.data["success"] == true) {
        return true;
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      debugPrint("Exception on Verify OTP: ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  Future<bool> resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      final response = await dio.post(
        "${BackendConstants.baseUrl}${BackendConstants.resetPasswordEndpoint}",
        data: {
          "token": token,
          "password": newPassword,
          "cpassword": confirmPassword,
        },
      );
      if (response.data["success"] == true) {
        return true;
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      debugPrint("Exception on Reset Password: ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}