import 'package:Claimit_app/core/constants/app_routes.dart';
import 'package:Claimit_app/features/dashboard/widgets/itemdetails.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:Claimit_app/features/dashboard/screens/dashboard.dart';
import 'package:Claimit_app/features/auth/screens/login_screen.dart';

class Routes {
  static List<GetPage> allRoute = [
    GetPage<dynamic>(
      name: ConstantRoute.loginpage,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: ConstantRoute.dashboard,
      page: () => DashboardScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: ConstantRoute.itemdetails,
      page: () => ItemDetailsPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: ConstantRoute.loginpage,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
  ];
}
