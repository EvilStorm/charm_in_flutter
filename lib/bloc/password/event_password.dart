abstract class PasswordCheckEvent {}

class Validation extends PasswordCheckEvent {
  String password;
  Validation({required this.password});
}

class DoubleCheck extends PasswordCheckEvent {
  String passwordCheck;
  DoubleCheck({required this.passwordCheck});
}
