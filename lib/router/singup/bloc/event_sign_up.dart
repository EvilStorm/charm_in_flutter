import 'package:charmin/constants/signed_type.dart';

abstract class SignUpEvent {}

class AddAccountEvent extends SignUpEvent {
  SignedType type;
  String? email;
  String? password;
  AddAccountEvent({required this.type, this.email, this.password});
}
