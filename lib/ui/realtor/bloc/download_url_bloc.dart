import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/repository/base/auth/auth_repo.dart';
import '../../dashboard/house/model/common_model.dart';

class DownloadUrlEvent {}

class DownloadUrlRefreshEvent extends DownloadUrlEvent {
  String?realtorId;
  DownloadUrlRefreshEvent({this.realtorId});
}

class DownloadUrlState {}

class DownloadUrlInitialState extends DownloadUrlState {}

class DownloadUrlLoadingState extends DownloadUrlState {}

class DownloadUrlSuccessState extends DownloadUrlState {
  CommonModel response;

  DownloadUrlSuccessState(this.response);
}

class DownloadUrlErrorState extends DownloadUrlState {
  String errorMsg;
  DownloadUrlErrorState(this.errorMsg);
}

class DownloadUrlBloc extends Bloc<DownloadUrlEvent, DownloadUrlState> {
  AuthRepository profileRepository = AuthRepository();

  DownloadUrlBloc(this.profileRepository) : super(DownloadUrlInitialState());

  Stream<DownloadUrlState> mapEventToState(DownloadUrlEvent event) async* {
    if (event is DownloadUrlRefreshEvent) {
      yield DownloadUrlLoadingState();
      var response = await profileRepository.downloadReport(event.realtorId??"");
      try{
        if (response.isSuccess) {
          yield DownloadUrlSuccessState(response.data);
        }else{
          yield DownloadUrlErrorState(response.error);
        }
      }
      catch (e,stackTrace){
        print(e);
        print(stackTrace);
        // yield DownloadUrlErrorState(StringControl.errorMessage);
      }

    }
  }
}
