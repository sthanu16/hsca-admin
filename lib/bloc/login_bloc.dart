import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsca/common/constant/app_utils.dart';

import '../api/repository/base/auth/auth_repo.dart';
import '../data/model/login_model.dart';

class LoginEvent {}

class LoginRefreshEvent extends LoginEvent {
  String? email;
  String? password;

  LoginRefreshEvent({this.email, this.password});
}

class LoginState {}

class LoginLoadingState extends LoginState {}


class LoginInitialState extends LoginState {
  LoginInitialState();
}

class LoginSuccessState extends LoginState {
  LoginModel? loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  String error;
  LoginErrorState(this.error);
}

class LoginBloc extends Bloc<LoginEvent,LoginState> {

  final AuthRepository _authRepository;

  LoginBloc(this._authRepository) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event) async* {
    if (event is LoginRefreshEvent) {
      try{
          yield LoginLoadingState();
          var res = await _authRepository.getLogin(email: event.email??'', password: event.password??"");
          if (res.isSuccess) {
           await AppUtils().setToken(res.data.token??"");
           AppUtils().setUserLoggedIn();
            yield LoginSuccessState(res.data);
          } else {
            yield LoginErrorState(res.error);
          }
      }catch(e){
        yield LoginErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
