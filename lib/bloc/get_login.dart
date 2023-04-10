import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsca/common/constant/app_utils.dart';

class GetLoginEvent {}

class GetLoginRefreshEvent extends GetLoginEvent {
  String? email;
  String? password;

  GetLoginRefreshEvent({this.email, this.password});
}

class GetLoginState {}

class GetLoginLoadingState extends GetLoginState {}


class GetLoginInitialState extends GetLoginState {
  GetLoginInitialState();
}

class GetLoginSuccessState extends GetLoginState {
  bool? isLogin;

  GetLoginSuccessState(this.isLogin);
}

class GetLoginErrorState extends GetLoginState {
  String error;
  GetLoginErrorState(this.error);
}

class GetLoginBloc extends Bloc<GetLoginEvent,GetLoginState> {



  GetLoginBloc() : super(GetLoginInitialState());

  @override
  Stream<GetLoginState> mapEventToState(
      GetLoginEvent event) async* {
    if (event is GetLoginRefreshEvent) {
      try{
        yield GetLoginLoadingState();
       var isLogin= await AppUtils().getUserLoggedIn();
        yield GetLoginSuccessState(isLogin);
      }catch(e){
        yield GetLoginErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
