import 'dart:async';
import 'package:get/get.dart';

import '../NewsScreen/NewsScreen.dart';

class Splash extends GetxController{
  @override
  void onInit() {
    Timer(const Duration(seconds: 5), ()
    {
      Get.offAll(NewScreen());
    });
    super.onInit();
  }
}