import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartlicense/controllers/admin_controller.dart';
import 'package:smartlicense/controllers/quiz_controller.dart';
import 'package:smartlicense/controllers/user_controller.dart';
import 'package:smartlicense/views/authentication/splash.dart';
import 'controllers/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(LoadingController());
  Get.put(AdminController()).initAdminStream();
  Get.put(UserController()).initUserStream();
  Get.put(QuizController());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyCustomSplashScreen(),
      );
    }));
  }
}
