abstract class AuthEvent {}

class SignInEvent extends AuthEvent {}

class SignInWithTokenInEvent extends AuthEvent {}

class AddAccountEvent extends AuthEvent {}

class PatchInfoEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class SignCheckEvent extends AuthEvent {}
