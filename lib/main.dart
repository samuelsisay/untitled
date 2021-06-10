import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/screens/splash/splash.dart';
import 'constants/firebase.dart';
import 'controllers/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then(
    (value) {
      Get.put(AppController());
      Get.put(AuthController());
      Get.put(BannerContoller());
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
