import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetransbook/ui/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings_screen.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      getPages: [
        GetPage<void>(
          name: '/',
          page: () => SplashScreen(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
