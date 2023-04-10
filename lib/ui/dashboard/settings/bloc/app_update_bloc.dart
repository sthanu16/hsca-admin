import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/repository/base/auth/auth_repo.dart';
import '../model/app_update_model.dart';
import '../model/app_update_response_model.dart';

class AppUpdateEvent {}

class AppUpdateRefreshEvent extends AppUpdateEvent {
  AppUpdateModel appUpdateModel;

  AppUpdateRefreshEvent(this.appUpdateModel);
}

class IsAndroidForceCheckBoxEvent extends AppUpdateEvent {
  bool value;

  IsAndroidForceCheckBoxEvent(this.value);
}

class IsIOSForceCheckBoxEvent extends AppUpdateEvent {
  bool value;

  IsIOSForceCheckBoxEvent(this.value);
}

class GetAppUpdateDataEvent extends AppUpdateEvent {
  //AppUpdateModel appUpdateModel;

  GetAppUpdateDataEvent();
}

class AppUpdateState {}

class AppUpdateLoadingState extends AppUpdateState {}

class ShowShimmerLoadingState extends AppUpdateState {}

class AppUpdateInitialState extends AppUpdateState {
  AppUpdateInitialState();
}

class IsAndroidForceCheckBoxState extends AppUpdateState {
  bool value;
  IsAndroidForceCheckBoxState(this.value);
}

class IsIOSForceCheckBoxState extends AppUpdateState {
  bool value;
  IsIOSForceCheckBoxState(this.value);
}

class AppUpdateSuccessState extends AppUpdateState {
  AppUpdateModel? appUpdateModel;

  AppUpdateSuccessState(this.appUpdateModel);


}class GetAppUpdateDataSuccessState extends AppUpdateState {
  AppUpdateResponseModel? appUpdateModel;

  GetAppUpdateDataSuccessState(this.appUpdateModel);
}

class AppUpdateErrorState extends AppUpdateState {
  String error;

  AppUpdateErrorState(this.error);
}

class AppUpdateBloc extends Bloc<AppUpdateEvent, AppUpdateState> {
  final AuthRepository _authRepository;

  AppUpdateBloc(this._authRepository) : super(AppUpdateInitialState());

  @override
  Stream<AppUpdateState> mapEventToState(AppUpdateEvent event) async* {
    if (event is AppUpdateRefreshEvent) {
      try {
        yield AppUpdateLoadingState();
        var res = await _authRepository.appUpdate(
            androidVersion: event.appUpdateModel.androidVersion??"",
            iosVersion: event.appUpdateModel.iosVersion ?? "",
            androidCode: event.appUpdateModel.androidCode.toString(),
            iosCode: event.appUpdateModel.iosCode.toString(),
            forceAndroidUpdate: event.appUpdateModel.forceAndroidUpdate.toString(),
            forceIosUpdate: event.appUpdateModel.forceIosUpdate.toString(),
            androidPackageName:event.appUpdateModel.androidPackageName.toString(),
            iosPackageName:event.appUpdateModel.iosPackageName.toString(),
            anroidDescription: event.appUpdateModel.androidDescription ?? "",
            iosDescription: event.appUpdateModel.iosDescription ?? "");
        if (res.isSuccess) {
          yield AppUpdateSuccessState(res.data);
        } else {
          yield AppUpdateErrorState(res.error);
        }
      } catch (e) {
        yield AppUpdateErrorState(e.toString());
        debugPrint(e.toString());
      }
    }else  if (event is GetAppUpdateDataEvent) {
      yield ShowShimmerLoadingState();
      var res = await _authRepository.getAppUpdateData();
      if (res.isSuccess) {
        yield GetAppUpdateDataSuccessState(res.data);
      } else {
        yield AppUpdateErrorState(res.error);
      }
    }else if(event is IsAndroidForceCheckBoxEvent){
      yield IsAndroidForceCheckBoxState(event.value);
    }else if(event is IsIOSForceCheckBoxEvent){
      yield IsIOSForceCheckBoxState(event.value);
    }


  }
}
