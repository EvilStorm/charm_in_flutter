import 'package:charmin/repository/repo_auth.dart';
import 'package:charmin/router/singup/bloc/event_sign_up.dart';
import 'package:charmin/router/singup/bloc/state_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late AuthRepository authRepository;
  SignUpBloc({
    required this.authRepository,
  }) : super(ReadyForEvent()) {
    on<AddAccountEvent>(_addAccount);
  }

  void _addAccount(AddAccountEvent event, Emitter<SignUpState> emit) {}
}
