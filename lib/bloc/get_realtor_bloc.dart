import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/repository/base/auth/auth_repo.dart';
import '../data/model/get_retailer_model.dart';

class RealtorListEvent {}

class RealtorListRefreshEvent extends RealtorListEvent {
  String? keyword;
  String? page;

  RealtorListRefreshEvent({this.keyword, this.page});
}

class SaveRealtorListRefreshEvent extends RealtorListEvent {
  DataBean getRetailerModel;

  SaveRealtorListRefreshEvent(this.getRetailerModel);
}

class GetRealtorListState extends RealtorListState {
  DataBean getRetailerModel;

  GetRealtorListState(this.getRetailerModel);
}

class RealtorListState {}

class RealtorListLoadingState extends RealtorListState {}


class RealtorListInitialState extends RealtorListState {
  RealtorListInitialState();
}

class RealtorListSuccessState extends RealtorListState {
  GetRetailerModel? getRetailerModel;

  RealtorListSuccessState(this.getRetailerModel);
}

class RealtorListErrorState extends RealtorListState {
  String error;
  RealtorListErrorState(this.error);
}

class RealtorListBloc extends Bloc<RealtorListEvent,RealtorListState> {

  final AuthRepository _authRepository;

  RealtorListBloc(this._authRepository) : super(RealtorListInitialState());

  @override
  Stream<RealtorListState> mapEventToState(
      RealtorListEvent event) async* {
    if (event is RealtorListRefreshEvent) {
      try{
        yield RealtorListLoadingState();
        var res = await _authRepository.getRealtor(keyword: event.keyword??"",page: event.page??"");
        if (res.isSuccess) {
          yield RealtorListSuccessState(res.data);
        } else {
          yield RealtorListErrorState(res.error);
        }
      }catch(e){
        yield RealtorListErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
    if (event is SaveRealtorListRefreshEvent) {
      try{
        yield GetRealtorListState(event.getRetailerModel);
      }catch(e){
        yield RealtorListErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
