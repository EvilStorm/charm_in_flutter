import 'dart:async';

import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/constants/signed_type.dart';
import 'package:charmin/repository/repo_auth.dart';
import 'package:charmin/utils/print.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const firebaesError = {
  'email-already-in-use': "사용중인 이메일 입니다.",
  'invalid-email': "이메일 주소를 사용해주세요."
};

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository authRepository;
  String? errorMessage;

  AuthBloc({
    required this.authRepository,
  }) : super(Empty()) {
    on<SignInEvent>(_signIn);
    on<EmailSignUpEvent>(_emailSignUp);
    on<EmailSignInEvent>(_emailSignIn);
    on<AutoSignInEvent>(_autoSignIn);
    on<SignOutEvent>(_signedOut);
  }

  String? _passwordValidation(String password) {
    RegExp regex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$');

    if (password.isEmpty) return "비밀번호를 입력하세요.";
    if (!regex.hasMatch(password)) return '비밀번호 형식을 맞춰주세요';

    return null;
  }

  String? _emailValidation(String email) {
    if (email.isEmpty) return "이메일을 입력하세요.";
    if (!EmailValidator.validate(email)) return "이메일 형식을 입력하세요.";

    return null;
  }

  void _emailSignIn(EmailSignInEvent event, Emitter<AuthState> emit) async {
    emit(Loading());

    final String? emailValidation = _emailValidation(event.email);
    if (emailValidation != null) {
      emit(ErrorHasMesasge(message: emailValidation));
      return;
    }
    final String? pwdValidation = _passwordValidation(event.password);
    if (pwdValidation != null) {
      emit(ErrorHasMesasge(message: pwdValidation));
      return;
    }
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);

      final addAccountResp = authRepository.signUp(
          result.user!.uid, result.user!.email!, SignedType.email);

      Print.i(addAccountResp);
    } on FirebaseAuthException catch (e) {
      emit(ErrorHasMesasge(
          message: firebaesError[e.code] ?? e.message ?? "오류가 발생했습니다."));
      return;
    }

    emit(SignedIn());
  }

  void _emailSignUp(EmailSignUpEvent event, Emitter<AuthState> emit) async {
    emit(Loading());

    final String? emailValidation = _emailValidation(event.email);
    if (emailValidation != null) {
      emit(ErrorHasMesasge(message: emailValidation));
      return;
    }
    final String? pwdValidation = _passwordValidation(event.password);
    if (pwdValidation != null) {
      emit(ErrorHasMesasge(message: pwdValidation));
      return;
    }
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      Print.e(result.toString());
    } on FirebaseAuthException catch (e) {
      emit(ErrorHasMesasge(
          message: firebaesError[e.code] ?? e.message ?? "오류가 발생했습니다."));
      return;
    }

    emit(SignedIn());
  }

  void _signIn(AuthEvent event, Emitter<AuthState> emit) async {
    emit(Loading());
  }

  void _autoSignIn(AutoSignInEvent event, Emitter<AuthState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    emit(SignedOut());
  }

  void _signedOut(SignOutEvent event, Emitter<AuthState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    emit(SignedOut());
  }
}
