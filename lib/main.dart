import 'package:claimit_app/features/auth/controllers/auth_controller.dart';
import 'package:claimit_app/features/auth/controllers/splash_controller.dart';
import 'package:claimit_app/features/auth/data/auth_repository.dart';
import 'package:claimit_app/features/dashboard/controllers/dashboard_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:claimit_app/core/routes/app_router.dart';
import 'package:claimit_app/features/auth/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://fgvgmxcxksatgwrhzvdc.supabase.co',
    publishableKey: 'sb_publishable_NEWQh8g-5_9Hx_hJyLCwyQ_zcCBzjqZ',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashCtrl()),
        ChangeNotifierProvider(create: (_) => AuthController(AuthRepository())),
        ChangeNotifierProvider(create: (_) => Dashboardcrtl()),
      ],
      child: GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: false,
              textScaler: const TextScaler.linear(0.95),
            ),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        // theme: themcon.themename,
        home: const SplashScreen(),
        getPages: Routes.allRoute,
      ),
    );
  }
}
