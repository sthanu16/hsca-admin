import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';
import '../model/delete_user_model.dart';

class DeleteHouseListEvent {}

class DeleteHouseListRefreshEvent extends DeleteHouseListEvent {
  String? houseId;
  int? index;


  DeleteHouseListRefreshEvent({this.houseId,this.index});
}

class DeleteHouseListState {}

class DeleteHouseListLoadingState extends DeleteHouseListState {}


class DeleteHouseListInitialState extends DeleteHouseListState {
  DeleteHouseListInitialState();
}

class DeleteHouseListSuccessState extends DeleteHouseListState {
  DeleteUserModel? DeleteHouseModel;
  int? index;

  DeleteHouseListSuccessState(this.DeleteHouseModel,this.index);
}

class DeleteHouseListErrorState extends DeleteHouseListState {
  String error;
  DeleteHouseListErrorState(this.error);
}

class DeleteHouseListBloc extends Bloc<DeleteHouseListEvent,DeleteHouseListState> {

  final AuthRepository _authRepository;

  DeleteHouseListBloc(this._authRepository) : super(DeleteHouseListInitialState());

  @override
  Stream<DeleteHouseListState> mapEventToState(
      DeleteHouseListEvent event) async* {
    if (event is DeleteHouseListRefreshEvent) {
      try{
        yield DeleteHouseListLoadingState();
        var res = await _authRepository.deleteHouse(event.houseId ??"");
        if (res.isSuccess) {
          yield DeleteHouseListSuccessState(res.data,event.index??0);
        } else {
          yield DeleteHouseListErrorState(res.error);
        }
      }catch(e){
        yield DeleteHouseListErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
