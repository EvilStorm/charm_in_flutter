import 'package:charmin/bloc/app_start/event_app_start.dart';
import 'package:charmin/bloc/app_start/state_app_start.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStartBloc extends Bloc<AppStartEvent, AppStartState> {
  AppStartBloc() : super(ReadyForStart()) {
    on<VersionCheckedEvent>(_checkedUpdate);
    on<CheckedSignEvent>(_checkedSignIn);
  }

  bool? isSignInSccessed;
  List<bool> readyForStart = [false, false];

  void _checkedUpdate(AppStartEvent event, Emitter<AppStartState> emit) {
    readyForStart[0] = true;
    if (_canStart()) {
      emit(_getFinalState());
    }
  }

  void _checkedSignIn(CheckedSignEvent event, Emitter<AppStartState> emit) {
    isSignInSccessed = event.isSuccess;

    readyForStart[1] = true;
    if (_canStart()) {
      emit(_getFinalState());
    }
  }

  AppStartState _getFinalState() {
    if (isSignInSccessed ?? false) {
      return StartMain();
    }
    return StartSignIn();
  }

  bool _canStart() {
    if (readyForStart.contains(false)) {
      return false;
    }
    return true;
  }
}
