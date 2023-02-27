import 'package:charmin/bloc/fetch_response.dart';

abstract class AuthState {}

class Empty extends AuthState {}

class Loading extends AuthState {}

class SignUpComplate extends AuthState {
  SignUpComplate({required String firebaseId});
}

class SignedIn extends AuthState {}

class SendPasswordResetEmail extends AuthState {}

class RetryTimer extends AuthState {
  String time;
  RetryTimer({required this.time});
}

class PasswordChangeEnableState extends AuthState {
  bool can;
  PasswordChangeEnableState({required this.can});
}

class ErrorHasMesasge extends AuthState {
  final String message;
  ErrorHasMesasge({required this.message});
}

class SignedOut extends AuthState {}

class HasBeenNotSigned extends AuthState {}

class AuthTokenLoaded extends AuthState {
  final FetchResponse response;

  AuthTokenLoaded({
    required this.response,
  });
}
