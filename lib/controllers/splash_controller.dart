import 'package:get/get.dart';
import 'package:flutter_boilerplate/global/route/index.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(Duration(seconds: 2));
    checkLogin();
    super.onInit();
  }

  void checkLogin() {
    Get.offAllNamed(routeName.home);
    //Get.toNamed(AppRouter.home);
  }
}
