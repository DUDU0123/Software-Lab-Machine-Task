import 'package:get/get.dart';

class OnboardingController extends GetxController{
  int currentPageIndex = 0;

  void updateIndex({required int index}){
    currentPageIndex = index;
    update();
  }
}