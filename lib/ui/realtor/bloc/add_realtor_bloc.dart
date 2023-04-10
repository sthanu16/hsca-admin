import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsca/ui/realtor/model/add_realtor_model.dart';

import '../../../api/repository/base/auth/auth_repo.dart';
import '../../../data/model/add_retailor_request_model.dart';

class AddRealtorEvent {}

class AddRealtorRefreshEvent extends AddRealtorEvent {
  AddRealtorRequestModel addRealtorRequestModel;

  AddRealtorRefreshEvent(this.addRealtorRequestModel);
}

class AddRealtorState {}

class AddRealtorLoadingState extends AddRealtorState {}

class AddRealtorInitialState extends AddRealtorState {
  AddRealtorInitialState();
}

class AddRealtorSuccessState extends AddRealtorState {
  AddRealtorModel? addRealtorModel;

  AddRealtorSuccessState(this.addRealtorModel);
}

class AddRealtorErrorState extends AddRealtorState {
  String error;

  AddRealtorErrorState(this.error);
}

class AddRealtorBloc extends Bloc<AddRealtorEvent, AddRealtorState> {
  final AuthRepository _authRepository;

  AddRealtorBloc(this._authRepository) : super(AddRealtorInitialState());

  @override
  Stream<AddRealtorState> mapEventToState(AddRealtorEvent event) async* {
    if (event is AddRealtorRefreshEvent) {
      try {
        yield AddRealtorLoadingState();
        var res = await _authRepository.addRealtor(
            realtorId: event.addRealtorRequestModel.realtorId ?? "",
            firstName: event.addRealtorRequestModel.firstName ?? "",
            lastName: event.addRealtorRequestModel.lastName ?? "",
            phone: event.addRealtorRequestModel.mobile ?? "",
            email: event.addRealtorRequestModel.email ?? "",
            streetAddress: event.addRealtorRequestModel.address ?? "",
            streetAddress2: event.addRealtorRequestModel.address ?? "",
            city: event.addRealtorRequestModel.city ?? "",
            state: event.addRealtorRequestModel.state ?? "",
            zipcode: event.addRealtorRequestModel.pinCode ?? "",
            country: event.addRealtorRequestModel.country ?? "");
        if (res.isSuccess) {
          yield AddRealtorSuccessState(res.data);
        } else {
          yield AddRealtorErrorState(res.error);
        }
      } catch (e) {
        yield AddRealtorErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
