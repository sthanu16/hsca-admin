import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';
import '../model/house_detail_model.dart';


class HouseDetailEvent {}

class HouseDetailRefreshEvent extends HouseDetailEvent {
  String? houseId;

  HouseDetailRefreshEvent({ this.houseId});
}

class HouseDetailState {}

class HouseDetailLoadingState extends HouseDetailState {}


class HouseDetailInitialState extends HouseDetailState {
  HouseDetailInitialState();
}

class HouseDetailSuccessState extends HouseDetailState {
  HouseDetail? houseDetailModel;

  HouseDetailSuccessState(this.houseDetailModel);
}

class HouseDetailErrorState extends HouseDetailState {
  String error;
  HouseDetailErrorState(this.error);
}

class HouseDetailBloc extends Bloc<HouseDetailEvent,HouseDetailState> {

  final AuthRepository _authRepository;

  HouseDetailBloc(this._authRepository) : super(HouseDetailInitialState());

  @override
  Stream<HouseDetailState> mapEventToState(
      HouseDetailEvent event) async* {
    if (event is HouseDetailRefreshEvent) {
      try{
        yield HouseDetailLoadingState();
        var res = await _authRepository.getHouseDetail(event.houseId??"");
        if (res.isSuccess) {
          yield HouseDetailSuccessState(res.data);
        } else {
          yield HouseDetailErrorState(res.error);
        }
      }catch(e){
        yield HouseDetailErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
