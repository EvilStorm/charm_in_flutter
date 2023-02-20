import 'package:charmin/bloc/fetch_response.dart';
import 'package:charmin/bloc/fetch_state.dart';

abstract class AuthState with FetchState {}

class SignedIn extends AuthState {
  final FetchResponse response;

  SignedIn({
    required this.response,
  });
}

class SignedOut extends AuthState {}

class HasBeenNotSigned extends AuthState {}

class AuthTokenLoaded extends AuthState {
  final FetchResponse response;

  AuthTokenLoaded({
    required this.response,
  });
}
