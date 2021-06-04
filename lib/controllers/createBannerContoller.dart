import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BannerContoller extends GetxController {
  static BannerContoller instance = Get.find();
  TextEditingController image = TextEditingController();
  TextEditingController campName = TextEditingController();
  TextEditingController campDesc = TextEditingController();

  createBanner() {}
}
