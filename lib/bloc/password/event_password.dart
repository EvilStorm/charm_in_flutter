abstract class PasswordCheckEvent {}

class Validation extends PasswordCheckEvent {
  String password;
  Validation({required this.password});
}
