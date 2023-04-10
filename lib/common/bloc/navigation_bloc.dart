import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationSelectionEvent {}

class BottomNavigationSelectionRefreshEvent extends BottomNavigationSelectionEvent {
  int? position;
  String? relatorId;

  BottomNavigationSelectionRefreshEvent(this.position, this.relatorId);
}

class BottomNavigationSelectionState {}

class BottomNavigationSelectionInitialState extends BottomNavigationSelectionState {
  BottomNavigationSelectionInitialState();
}

class BottomNavigationSelectionIndexState extends BottomNavigationSelectionState {
  int index=0;
  String? refId;

  BottomNavigationSelectionIndexState(this.index, this.refId);
}

class BottomNavigationSelectionBloc extends Bloc<BottomNavigationSelectionEvent,
    BottomNavigationSelectionState> {
  BottomNavigationSelectionBloc()
      : super(BottomNavigationSelectionInitialState());

  Stream<BottomNavigationSelectionState> mapEventToState(
      BottomNavigationSelectionEvent event) async* {
    if (event is BottomNavigationSelectionRefreshEvent) {
      yield BottomNavigationSelectionIndexState(event.position ?? 0, event.relatorId ?? '');
    }
  }
}
