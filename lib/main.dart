import 'package:claimit_app/features/auth/controllers/login_controller.dart';
import 'package:claimit_app/features/auth/controllers/splash_controller.dart';
import 'package:claimit_app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:claimit_app/core/constants/app_router.dart';
import 'package:claimit_app/features/auth/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashCtrl()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => Dashboardcrtl()),
      ],
      child: GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: false,
              textScaler: TextScaler.linear(0.95),
            ),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        // theme: themcon.themename,
        home: SplashScreen(),
        getPages: Routes.allRoute,
      ),
    );
  }
}
