import 'package:charmin/bloc/fetch_response.dart';

abstract class AuthState {}

class Empty extends AuthState {}

class Loading extends AuthState {}

class SignUpComplate extends AuthState {
  SignUpComplate({required String firebaseId});
}

class SignedIn extends AuthState {}

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
