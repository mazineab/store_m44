import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_m44/core/utils/localStorage/shared_pref_manager.dart';
import 'package:store_m44/features/home/screens/splash_page.dart';
import 'package:store_m44/routes/routes.dart';
import 'package:store_m44/routes/routes_names.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Get.put(SharedPrefManager()).init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
      getPages:Routes.appRoutes(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

