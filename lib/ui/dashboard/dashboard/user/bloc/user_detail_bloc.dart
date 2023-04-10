import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';
import '../../../house/model/sent_report_model.dart';
import '../model/user_detail_model.dart';


class UserDetailEvent {}

class UserDetailRefreshEvent extends UserDetailEvent {
  String userId;

  UserDetailRefreshEvent(this.userId);
}

class UserSendReportRefreshEvent extends UserDetailEvent {
  String? userId;
  String? email;

  UserSendReportRefreshEvent({this.userId, this.email});
}

class UserDetailState {}

class UserDetailLoadingState extends UserDetailState {}


class UserDetailInitialState extends UserDetailState {
  UserDetailInitialState();
}

class UserDetailSuccessState extends UserDetailState {
  UserDetailModel? userDetailModel;

  UserDetailSuccessState(this.userDetailModel);
}

class UserReportSuccessState extends UserDetailState {
  SentReportModel data;

  UserReportSuccessState(this.data);
}

class UserDetailErrorState extends UserDetailState {
  String error;
  UserDetailErrorState(this.error);
}

class UserDetailBloc extends Bloc<UserDetailEvent,UserDetailState> {

  final AuthRepository _authRepository;

  UserDetailBloc(this._authRepository) : super(UserDetailInitialState());

  @override
  Stream<UserDetailState> mapEventToState(
      UserDetailEvent event) async* {
    if (event is UserDetailRefreshEvent) {
      try{
        yield UserDetailLoadingState();
        var res = await _authRepository.getUserDetail(event.userId);
        if (res.isSuccess) {
          yield UserDetailSuccessState(res.data);
        } else {
          yield UserDetailErrorState(res.error);
        }
      }catch(e){
        yield UserDetailErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
    if (event is UserSendReportRefreshEvent) {
      try{
        yield UserDetailLoadingState();
        var res = await _authRepository.submitReport(userId: event.userId??"",email: event.email??"");
        if (res.isSuccess) {
          yield UserReportSuccessState(res.data);
        } else {
          yield UserDetailErrorState(res.error);
        }
      }catch(e){
        yield UserDetailErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
