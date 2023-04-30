import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovecture/Pages/Splash/binding/splash_binding.dart';

import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TASK',
        initialBinding: SplashBinding(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes);
  }
}
