import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsca/ui/dashboard/dashboard/user/model/user_list_model.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';


class UserListEvent {}

class UserListRefreshEvent extends UserListEvent {
  String? keyword;
  String? page;

  UserListRefreshEvent({this.keyword, this.page});
}

class UserListState {}

class UserListLoadingState extends UserListState {}


class UserListInitialState extends UserListState {
  UserListInitialState();
}

class UserListSuccessState extends UserListState {
  UserListModel? userListModel;

  UserListSuccessState(this.userListModel);
}

class UserListErrorState extends UserListState {
  String error;
  UserListErrorState(this.error);
}

class UserListBloc extends Bloc<UserListEvent,UserListState> {

  final AuthRepository _authRepository;

  UserListBloc(this._authRepository) : super(UserListInitialState());

  @override
  Stream<UserListState> mapEventToState(
      UserListEvent event) async* {
    if (event is UserListRefreshEvent) {
      try{
        yield UserListLoadingState();
        var res = await _authRepository.getUserList(event.keyword??"",event.page ??""
        );
        if (res.isSuccess) {
          yield UserListSuccessState(res.data);
        } else {
          yield UserListErrorState(res.error);
        }
      }catch(e){
        yield UserListErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}