
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/repository/base/auth/auth_repo.dart';
import '../../../../common/constant/string.dart';
import '../model/change_password_model.dart';

class ChangePasswordEvents {}

class ChangePasswordRefreshEvent extends ChangePasswordEvents {
  String? oldPassword;
  String? newPassword;

  ChangePasswordRefreshEvent({this.newPassword, this.oldPassword});
}

class ChangePasswordState {}

class ChangePasswordInitState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {
  ChangePasswordModel data;

  ChangePasswordSuccessState(this.data);
}

class ChangePasswordErrorState extends ChangePasswordState {
  String error;

  ChangePasswordErrorState(this.error);
}

class ChangePasswordBloc extends Bloc<ChangePasswordEvents, ChangePasswordState> {
  final AuthRepository repo;

  ChangePasswordBloc(this.repo) : super(ChangePasswordInitState());

  @override
  Stream<ChangePasswordState> mapEventToState(ChangePasswordEvents event) async* {
    if (event is ChangePasswordRefreshEvent) {
      yield ChangePasswordLoadingState();
      try {
        var res = await repo.changePassword(
          oldPassword: event.oldPassword??"", newPassword: event.newPassword??"",);
        if (res.isSuccess) {
          yield ChangePasswordSuccessState(res.data);
        } else {
          yield ChangePasswordErrorState(res.error);
        }
      } catch (e) {
        yield ChangePasswordErrorState(StringControl.errorMessage);
      }
    }
  }
}
