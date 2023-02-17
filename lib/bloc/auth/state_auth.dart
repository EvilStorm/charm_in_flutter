import 'package:charmin/bloc/fetch_response.dart';
import 'package:charmin/bloc/fetch_state.dart';

class SignedIn extends FetchState {
  final FetchResponse response;

  SignedIn({
    required this.response,
  });
}

class SignedOut extends FetchState {}

class AuthTokenLoaded extends FetchState {
  final FetchResponse response;

  AuthTokenLoaded({
    required this.response,
  });
}
