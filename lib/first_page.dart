import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsca/ui/auth/login/login_screen.dart';
import 'package:hsca/ui/dashboard/dashboard/dashboard_screen.dart';
import 'package:hsca/ui/dashboard/dashboard/user/bloc/dashboard_bloc.dart';
import 'package:hsca/ui/splash/splash_screen.dart';

import 'bloc/get_login.dart';
import 'common/constant/responsive.dart';
import 'common/custom_widget/screen_size_dialog.dart';

class FirstPage extends StatefulWidget {

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isFirst= true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetLoginBloc>(context).add(GetLoginRefreshEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLoginBloc,GetLoginState>(builder: (context,state){
      if(state is GetLoginSuccessState){
       if(state.isLogin??false){
         BlocProvider.of<DashboardBloc>(context).add(DashboardRefreshEvent());
       }
        return Responsive.isDesktop(context)? state.isLogin==true ? const DashBoardScreen() : const LoginScreen() : const CommonDialog();
      }else{
        return const SplashScreen();
      }
    });

  }
}

