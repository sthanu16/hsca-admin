// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../first_page.dart' as _i1;
import '../../ui/auth/login/login_screen.dart' as _i3;
import '../../ui/auth/password/forgot_password.dart' as _i5;
import '../../ui/dashboard/dashboard/dashboard_screen.dart' as _i4;
import '../../ui/splash/splash_screen.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    FirstPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.FirstPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    DashBoardScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DashBoardScreen(),
      );
    },
    ForgetPasswordScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPasswordScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          FirstPageRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          SplashScreenRoute.name,
          path: '/splash-screen',
        ),
        _i6.RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        _i6.RouteConfig(
          DashBoardScreenRoute.name,
          path: '/dash-board-screen',
        ),
        _i6.RouteConfig(
          ForgetPasswordScreenRoute.name,
          path: '/forget-password-screen',
        ),
      ];
}

/// generated route for
/// [_i1.FirstPage]
class FirstPageRoute extends _i6.PageRouteInfo<void> {
  const FirstPageRoute()
      : super(
          FirstPageRoute.name,
          path: '/',
        );

  static const String name = 'FirstPageRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/splash-screen',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i6.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.DashBoardScreen]
class DashBoardScreenRoute extends _i6.PageRouteInfo<void> {
  const DashBoardScreenRoute()
      : super(
          DashBoardScreenRoute.name,
          path: '/dash-board-screen',
        );

  static const String name = 'DashBoardScreenRoute';
}

/// generated route for
/// [_i5.ForgetPasswordScreen]
class ForgetPasswordScreenRoute extends _i6.PageRouteInfo<void> {
  const ForgetPasswordScreenRoute()
      : super(
          ForgetPasswordScreenRoute.name,
          path: '/forget-password-screen',
        );

  static const String name = 'ForgetPasswordScreenRoute';
}
