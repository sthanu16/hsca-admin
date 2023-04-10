import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';

import '../model/delete_realtor_model.dart';

class DeleteRealtorEvent {}

class DeleteRealtorRefreshEvent extends DeleteRealtorEvent {
  String? realtorId;
  int? index;

  DeleteRealtorRefreshEvent({ this.realtorId,this.index});
}

class DeleteRealtorState {}

class DeleteRealtorLoadingState extends DeleteRealtorState {}


class DeleteRealtorInitialState extends DeleteRealtorState {
  DeleteRealtorInitialState();
}

class DeleteRealtorSuccessState extends DeleteRealtorState {
  DeleteRealtorModel? deleteRealtorModel;
  int? index;

  DeleteRealtorSuccessState(this.deleteRealtorModel,this.index);
}

class DeleteRealtorErrorState extends DeleteRealtorState {
  String error;
  DeleteRealtorErrorState(this.error);
}

class DeleteRealtorBloc extends Bloc<DeleteRealtorEvent,DeleteRealtorState> {

  final AuthRepository _authRepository;

  DeleteRealtorBloc(this._authRepository) : super(DeleteRealtorInitialState());

  @override
  Stream<DeleteRealtorState> mapEventToState(
      DeleteRealtorEvent event) async* {
    if (event is DeleteRealtorRefreshEvent) {
      try{
        yield DeleteRealtorLoadingState();
        var res = await _authRepository.deleteRealtor(event.realtorId ??"");
        if (res.isSuccess) {
          yield DeleteRealtorSuccessState(res.data,event.index);
        } else {
          yield DeleteRealtorErrorState(res.error);
        }
      }catch(e){
        yield DeleteRealtorErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
