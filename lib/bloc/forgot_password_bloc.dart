import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository/base/auth/auth_repo.dart';
import '../ui/dashboard/settings/model/forgot_password_model.dart';


class ForgotPasswordEvent {}

class ForgotPasswordButtonEvent extends ForgotPasswordEvent {
  String email;
  ForgotPasswordButtonEvent(this.email);
}

class ForgotPasswordState {}

class ForgotPasswordInitState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  ForgotPasswordModel? forgotPasswordModel;

  ForgotPasswordSuccessState(this.forgotPasswordModel);
}

class ForgotPasswordErrorState extends ForgotPasswordState {
  String error;
  ForgotPasswordErrorState(this.error);
}

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository _authRepo;

  ForgotPasswordBloc(this._authRepo) : super(ForgotPasswordInitState());

  @override
  Stream<ForgotPasswordState> mapEventToState(ForgotPasswordEvent event) async* {
    if (event is ForgotPasswordButtonEvent) {
      yield ForgotPasswordLoadingState();
      try {
        var res = await _authRepo.forgotPassword(event.email);
        if (res.isSuccess) {
          yield ForgotPasswordSuccessState(res.data);
        }else{
          if(res.error.isNotEmpty){
            yield ForgotPasswordErrorState(res.error);
          }else{
            yield ForgotPasswordErrorState(res.error);
          }
        }
      }
      catch (e)
      {}
    }
  }
}
