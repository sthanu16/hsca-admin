import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';
import '../model/delete_user_model.dart';

class DeleteUserListEvent {}

class DeleteUserListRefreshEvent extends DeleteUserListEvent {
  String? userId;
  int? index;


  DeleteUserListRefreshEvent({this.userId,this.index});
}

class DeleteUserListState {}

class DeleteUserListLoadingState extends DeleteUserListState {}


class DeleteUserListInitialState extends DeleteUserListState {
  DeleteUserListInitialState();
}

class DeleteUserListSuccessState extends DeleteUserListState {
  DeleteUserModel? deleteUserModel;
  int? index;

  DeleteUserListSuccessState(this.deleteUserModel,this.index);
}

class DeleteUserListErrorState extends DeleteUserListState {
  String error;
  DeleteUserListErrorState(this.error);
}

class DeleteUserListBloc extends Bloc<DeleteUserListEvent,DeleteUserListState> {

  final AuthRepository _authRepository;

  DeleteUserListBloc(this._authRepository) : super(DeleteUserListInitialState());

  @override
  Stream<DeleteUserListState> mapEventToState(
      DeleteUserListEvent event) async* {
    if (event is DeleteUserListRefreshEvent) {
      try{
        yield DeleteUserListLoadingState();
        var res = await _authRepository.deleteUser(event.userId ??"");
        if (res.isSuccess) {
          yield DeleteUserListSuccessState(res.data,event.index??0);
        } else {
          yield DeleteUserListErrorState(res.error);
        }
      }catch(e){
        yield DeleteUserListErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
