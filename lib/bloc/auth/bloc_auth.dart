import 'dart:async';

import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/bloc/fetch_response.dart';
import 'package:charmin/bloc/fetch_state.dart';
import 'package:charmin/repository/repo_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, FetchState> {
  late AuthRepository authRepository;
  AuthBloc({
    required this.authRepository,
  }) : super(Empty()) {
    on<SignInEvent>(_signIn);
    on<AutoSignInEvent>(_autoSignIn);
    on<SignOutEvent>(_signedOut);
  }

  void _signIn(AuthEvent event, Emitter<FetchState> emit) async {
    emit(Loading());
  }

  void _autoSignIn(AutoSignInEvent event, Emitter<FetchState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    emit(SignedOut());
  }

  void _signedOut(SignOutEvent event, Emitter<FetchState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    emit(SignedOut());
  }
}
