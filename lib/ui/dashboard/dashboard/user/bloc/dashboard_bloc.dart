import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';
import '../../../../../data/model/get_dashboard_model.dart';


class DashboardEvent {}

class DashboardRefreshEvent extends DashboardEvent {

  DashboardRefreshEvent();
}

class DashboardState {}

class DashboardLoadingState extends DashboardState {}


class DashboardInitialState extends DashboardState {
  DashboardInitialState();
}

class DashboardSuccessState extends DashboardState {
  GetDashboardModel? dashboardModel;

  DashboardSuccessState(this.dashboardModel);
}

class DashboardErrorState extends DashboardState {
  String error;
  DashboardErrorState(this.error);
}

class DashboardBloc extends Bloc<DashboardEvent,DashboardState> {

  final AuthRepository _authRepository;

  DashboardBloc(this._authRepository) : super(DashboardInitialState());

  @override
  Stream<DashboardState> mapEventToState(
      DashboardEvent event) async* {
    if (event is DashboardRefreshEvent) {
      try{
        yield DashboardLoadingState();
        var res = await _authRepository.getDashboard();
        if (res.isSuccess) {
          yield DashboardSuccessState(res.data);
        } else {
          yield DashboardErrorState(res.error);
        }
      }catch(e){
        yield DashboardErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
