import 'dart:async';
import 'dart:convert';

import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/constants/signed_type.dart';
import 'package:charmin/models/model_user.dart';
import 'package:charmin/repository/repo_auth.dart';
import 'package:charmin/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const firebaesError = {
  'email-already-in-use': "사용중인 이메일 입니다.",
  'invalid-email': "이메일 주소를 사용해주세요.",
  'user-not-found': "아이디,비밀번호를 확인해주세요.",
};

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository authRepository;
  String? errorMessage;

  late UserModel userInfo;

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
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);

      // final addAccountResp = authRepository.signIn(result.user!.uid);
      await _charmInSignIn(result.user!.uid, emit);
    } on FirebaseAuthException catch (e) {
      emit(ErrorHasMesasge(
          message: firebaesError[e.code] ?? e.message ?? "오류가 발생했습니다."));
      return;
    }
  }

  Future<void> _charmInSignIn(
      String firebaseId, Emitter<AuthState> emit) async {
    try {
      Response addAccountResp = await authRepository.signIn(firebaseId);
      Print.i(addAccountResp);
      if (addAccountResp.statusCode != 200) {
        emit(ErrorHasMesasge(
            message: addAccountResp.statusMessage ?? "문제가 있습니다."));
        return;
      }

      userInfo = UserModel.fromJson(addAccountResp.data['data']);

      emit(SignedIn());
    } catch (e) {
      emit(ErrorHasMesasge(message: e.toString()));
      return;
    }
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
    if (event.password != event.checkPassword) {
      emit(ErrorHasMesasge(message: "두 비밀번호가 다릅니다."));
      return;
    }

    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      final signInUp = await authRepository.signUp(
          result.user!.uid, event.email, SignedType.email);

      await _charmInSignIn(result.user!.uid, emit);

      // emit(SignUpComplate(firebaseId: result.user!.uid));
    } on FirebaseAuthException catch (e) {
      emit(ErrorHasMesasge(
          message: firebaesError[e.code] ?? e.message ?? "오류가 발생했습니다."));
      return;
    } catch (e) {
      emit(ErrorHasMesasge(message: e.toString()));
      return;
    }
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
