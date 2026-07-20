import 'package:claimit_app/core/routes/route_names.dart';
import 'package:claimit_app/features/dashboard/widgets/itemdetails.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:claimit_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:claimit_app/features/auth/screens/login_screen.dart';

class Routes {
  static List<GetPage> allRoute = [
    GetPage<dynamic>(
      name: RouteNames.loginpage,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: RouteNames.dashboard,
      page: () => DashboardScreen(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: RouteNames.itemdetails,
      page: () => ItemDetailsPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(seconds: 1),
    ),
  ];
}
