import 'package:charmin/bloc/fetch_event.dart';
import 'package:charmin/constants/signed_type.dart';

abstract class AuthEvent with FetchEvent {}

class SignInEvent extends AuthEvent {}

class EmailSignInEvent extends AuthEvent {
  String email;
  String password;

  EmailSignInEvent({required this.email, required this.password});
}

class FireBaseIdSignInEvent extends AuthEvent {
  String firebaseId;

  FireBaseIdSignInEvent({required this.firebaseId});
}

class FindPasswordEvent extends AuthEvent {
  String email;

  FindPasswordEvent({required this.email});
}

class EmailSignUpEvent extends AuthEvent {
  String email;
  String password;
  String checkPassword;

  EmailSignUpEvent(
      {required this.email,
      required this.password,
      required this.checkPassword});
}

class ThridPartySignIn extends AuthEvent {
  SignedType type;
  ThridPartySignIn({required this.type});
}

class SendEmailEvent extends AuthEvent {}

class FindPasswordResetEvent extends AuthEvent {}

class RetryCountEvent extends AuthEvent {
  String time;
  RetryCountEvent({required this.time});
}

class AutoSignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class AddAccountEvent extends AuthEvent {}

class PatchInfoEvent extends AuthEvent {}
