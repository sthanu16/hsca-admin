import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/repository/base/auth/auth_repo.dart';
import '../../../../../common/constant/string.dart';
import '../model/update_realtor_model.dart';

class UpdateRealtorEvents {}

class UpdateRealtorRefreshEvent extends UpdateRealtorEvents {
  UpdateRealtorModel? updateRealtorModel;

  UpdateRealtorRefreshEvent({this.updateRealtorModel});
}

class UpdateRealtorState {}

class UpdateRealtorInitState extends UpdateRealtorState {}

class UpdateRealtorLoadingState extends UpdateRealtorState {}

class UpdateRealtorSuccessState extends UpdateRealtorState {
  UpdateRealtorModel data;

  UpdateRealtorSuccessState(this.data);
}

class UpdateRealtorErrorState extends UpdateRealtorState {
  String error;

  UpdateRealtorErrorState(this.error);
}

class UpdateRealtorBloc extends Bloc<UpdateRealtorEvents, UpdateRealtorState> {
  final AuthRepository repo;

  UpdateRealtorBloc(this.repo) : super(UpdateRealtorInitState());

  @override
  Stream<UpdateRealtorState> mapEventToState(UpdateRealtorEvents event) async* {
    if (event is UpdateRealtorRefreshEvent) {
      yield UpdateRealtorLoadingState();
      try {
        var res = await repo.updateRealtor(
            realtorId: event.updateRealtorModel?.realtorId ??"",
            firstName: event.updateRealtorModel?.firstName ??"",
            lastName: event.updateRealtorModel?.lastName ??"",
            phone: event.updateRealtorModel?.phone ??"",
            email: event.updateRealtorModel?.email ??"",
            streetAddress: event.updateRealtorModel?.streetAddress ??"",
            streetAddress2: event.updateRealtorModel?.streetAddress2 ??"",
            city: event.updateRealtorModel?.city ??"",
            state: event.updateRealtorModel?.state ??"",
            zipcode:event.updateRealtorModel?.zipcode ??"",
            country: event.updateRealtorModel?.country ??"");
        if (res.isSuccess) {
          yield UpdateRealtorSuccessState(res.data);
        } else {
          yield UpdateRealtorErrorState(res.error);
        }
      } catch (e) {
        yield UpdateRealtorErrorState(StringControl.errorMessage);
      }
    }
  }
}
