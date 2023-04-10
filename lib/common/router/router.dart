import 'package:auto_route/auto_route.dart';
import 'package:hsca/first_page.dart';

import '../../ui/auth/login/login_screen.dart';
import '../../ui/dashboard/dashboard/dashboard_screen.dart';
import '../../ui/splash/splash_screen.dart';


@MaterialAutoRouter(
    routes: (<AutoRoute>[
      MaterialRoute(page: FirstPage,initial: true),
      MaterialRoute(page: SplashScreen),
      MaterialRoute(page: LoginScreen),
      MaterialRoute(page: DashBoardScreen),
    ]))
class $AppRouter {}