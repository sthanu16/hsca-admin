import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../api/repository/base/auth/auth_repo.dart';
import '../model/sent_report_model.dart';


class SentReportEvent {}

class SentReportRefreshEvent extends SentReportEvent {
  String? userId;
  String? email;

  SentReportRefreshEvent(this.userId,this.email);
}

class SentReportState {}

class SentReportLoadingState extends SentReportState {}

class SentReportInitialState extends SentReportState {
  SentReportInitialState();
}

class SentReportSuccessState extends SentReportState {
  SentReportModel? sentReportModel;

  SentReportSuccessState(this.sentReportModel);
}

class SentReportErrorState extends SentReportState {
  String error;

  SentReportErrorState(this.error);
}

class SentReportBloc extends Bloc<SentReportEvent, SentReportState> {
  final AuthRepository _authRepository;

  SentReportBloc(this._authRepository) : super(SentReportInitialState());

  @override
  Stream<SentReportState> mapEventToState(SentReportEvent event) async* {
    if (event is SentReportRefreshEvent) {
      try {
        yield SentReportLoadingState();
        var res = await _authRepository.submitReport(
          userId: event.userId ?? "",
          email: event.email ?? "");
        if (res.isSuccess) {
          yield SentReportSuccessState(res.data);
        } else {
          yield SentReportErrorState(res.error);
        }
      } catch (e) {
        yield SentReportErrorState(e.toString());
        debugPrint(e.toString());
      }
    }
  }
}
