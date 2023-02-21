import 'package:charmin/bloc/fetch_event.dart';
import 'package:charmin/constants/signed_type.dart';

abstract class AuthEvent with FetchEvent {}

class SignInEvent extends AuthEvent {}

class EmailSignInEvent extends AuthEvent {
  String email;
  String password;

  EmailSignInEvent({required this.email, required this.password});
}

class EmailSignUpEvent extends AuthEvent {
  String email;
  String password;

  EmailSignUpEvent({required this.email, required this.password});
}

class ThridPartySignIn extends AuthEvent {
  SignedType type;
  ThridPartySignIn({required this.type});
}

class AutoSignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class AddAccountEvent extends AuthEvent {}

class PatchInfoEvent extends AuthEvent {}
