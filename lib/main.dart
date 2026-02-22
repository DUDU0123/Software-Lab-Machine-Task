import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_task_app/controller/authentication_controller.dart';
import 'package:machine_task_app/controller/onboarding_controller.dart';
import 'package:machine_task_app/model/repositories/authentication/authentication_repo.dart';
import 'package:machine_task_app/view/root_widget_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(RootWidgetPage());
}

initializeDependencies() {
  Get.put<Dio>(Dio());
  Get.put<OnboardingController>(OnboardingController());
  Get.put<AuthenticationRepo>(AuthenticationRepo(dio: Get.find<Dio>()));
  Get.put<AuthenticationController>(AuthenticationController(authenticationRepo: Get.find<AuthenticationRepo>()));
}