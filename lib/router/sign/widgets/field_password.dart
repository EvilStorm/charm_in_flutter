import 'package:charmin/bloc/password/bloc_password.dart';
import 'package:charmin/bloc/password/event_password.dart';
import 'package:charmin/constants/constants.dart';
import 'package:charmin/router/sign/widgets/display_password_validation.dart';
import 'package:charmin/router/sign/widgets/display_sign_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidePassword = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PasswordBloc passwordBloc = BlocProvider.of<PasswordBloc>(context);
    return TextFormField(
      controller: _passwordController,
      onChanged: (value) {
        passwordBloc.add(Validation(password: value));
        passwordBloc.add(DoubleCheck(passwordCheck: "checkPrev"));
      },
      obscureText: hidePassword,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        labelText: '비밀번호',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: hidePassword
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
      ),
    );
  }
}
