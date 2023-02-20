import 'package:charmin/bloc/fetch_event.dart';

abstract class AuthEvent with FetchEvent {}

class SignInEvent extends AuthEvent {}

class AutoSignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class AddAccountEvent extends AuthEvent {}

class PatchInfoEvent extends AuthEvent {}
