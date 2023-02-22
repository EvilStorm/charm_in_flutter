import 'package:charmin/bloc/password/event_password.dart';
import 'package:charmin/bloc/password/state_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordBloc extends Bloc<PasswordCheckEvent, PasswordCheckState> {
  String? password;
  String? passwordCheck;

  PasswordBloc() : super(ReadyForStart()) {
    on<Validation>(_checkValidation);
    on<DoubleCheck>(_doubleCheck);
  }

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$');

  RegExp upperCase = RegExp(r'^(?=.*?[A-Z]).{1,}$');
  RegExp lowerCase = RegExp(r'^(?=.*?[a-z]).{1,}$');
  RegExp numberCase = RegExp(r'^(?=.*?[0-9]).{1,}$');
  RegExp specialCase = RegExp(r'^(?=.*?[!@#\$&*~]).{1,}$');
  RegExp lengthCase = RegExp(r'^.{8,20}$');

  void _checkValidation(Validation event, Emitter<PasswordCheckState> emit) {
    password = event.password;

    List<ValidationModel> result = [];
    result.add(ValidationModel(
        validation: "a~z", isOk: lowerCase.hasMatch(event.password)));
    result.add(ValidationModel(
        validation: "A~Z", isOk: upperCase.hasMatch(event.password)));
    result.add(ValidationModel(
        validation: "0~9", isOk: numberCase.hasMatch(event.password)));
    result.add(ValidationModel(
        validation: "!@#\$&*~", isOk: specialCase.hasMatch(event.password)));
    result.add(ValidationModel(
        validation: "8~20", isOk: lengthCase.hasMatch(event.password)));

    int hasFalse = result.indexWhere((e) => e.isOk == false);

    emit(ValidationState(steps: result, totalOk: (hasFalse == -1)));
  }

  void _doubleCheck(DoubleCheck event, Emitter<PasswordCheckState> emit) {
    if (event.passwordCheck == "checkPrev") {
    } else {
      passwordCheck = event.passwordCheck;
    }

    return emit(DoubleCheckState(isOk: (password == passwordCheck)));
  }
}
