import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/dashboard_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/delete_house_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/delete_realtor_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/delete_user_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/update_realtor_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/user_detail_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/user_list_bloc.dart';
import 'package:hsca/ui/dashboard/house/bloc/house_detail_bloc.dart';
import 'package:hsca/ui/dashboard/house/bloc/sent_report_bloc.dart';
import 'package:hsca/ui/dashboard/settings/bloc/app_update_bloc.dart';
import 'package:hsca/ui/dashboard/settings/bloc/change_password_bloc.dart';
import 'package:hsca/ui/realtor/bloc/add_realtor_bloc.dart';

import 'bloc/get_login.dart';

import 'api/repository/base/auth/auth_repo.dart';
import 'bloc/get_realtor_bloc.dart';
import 'bloc/login_bloc.dart';
import 'common/bloc/navigation_bloc.dart';
import 'common/constant/app_utils.dart';
import 'common/locator/locator.dart';
import 'common/router/router.gr.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool? isLogIn;

  @override
  void initState() {
    super.initState();
    getLogin();
  }

  getLogin()async{
   await AppUtils().getUserLoggedIn().then((value) {
      isLogIn = value;
    });
  }

  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationSelectionBloc>(create: (context) => BottomNavigationSelectionBloc()),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(_authRepository)),
        BlocProvider<RealtorListBloc>(create: (context) => RealtorListBloc(_authRepository)),
        BlocProvider<AddRealtorBloc>(create: (context) => AddRealtorBloc(_authRepository)),
        BlocProvider<ChangePasswordBloc>(create: (context) => ChangePasswordBloc(_authRepository)),
        BlocProvider<UserListBloc>(create: (context) => UserListBloc(_authRepository)),
        BlocProvider<DashboardBloc>(create: (context) => DashboardBloc(_authRepository)),
        BlocProvider<UserDetailBloc>(create: (context) => UserDetailBloc(_authRepository)),
        BlocProvider<UpdateRealtorBloc>(create: (context) => UpdateRealtorBloc(_authRepository)),
        BlocProvider<DeleteRealtorBloc>(create: (context) => DeleteRealtorBloc(_authRepository)),
        BlocProvider<DeleteUserListBloc>(create: (context) => DeleteUserListBloc(_authRepository)),
        BlocProvider<AppUpdateBloc>(create: (context) => AppUpdateBloc(_authRepository)),
        BlocProvider<DeleteHouseListBloc>(create: (context) => DeleteHouseListBloc(_authRepository)),
        BlocProvider<SentReportBloc>(create: (context) => SentReportBloc(_authRepository)),
        BlocProvider<GetLoginBloc>(create: (context) => GetLoginBloc()),
        BlocProvider<HouseDetailBloc>(create: (context) => HouseDetailBloc(_authRepository)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          return MaterialApp.router(
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            title: "Home2check",
            debugShowCheckedModeBanner: false,
            routerDelegate: locator<AppRouter>().delegate(),
            routeInformationParser:
            locator<AppRouter>().defaultRouteParser(),
          );
        }
      ),
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

