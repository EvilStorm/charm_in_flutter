import 'package:charmin/bloc/password/bloc_password.dart';
import 'package:charmin/bloc/password/event_password.dart';
import 'package:charmin/bloc/password/state_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordCheckField extends StatefulWidget {
  const PasswordCheckField({super.key});

  @override
  State<PasswordCheckField> createState() => _PasswordCheckFieldState();
}

class _PasswordCheckFieldState extends State<PasswordCheckField> {
  bool hidePassword = true;

  final TextEditingController _controller = TextEditingController();

  Widget getCheckIcon(PasswordCheckState state) {
    if (state is DoubleCheckState && state.isOk) return const Icon(Icons.done);
    return const Icon(Icons.cancel);
  }

  @override
  Widget build(BuildContext context) {
    PasswordBloc passwordBloc = BlocProvider.of<PasswordBloc>(context);
    return BlocConsumer<PasswordBloc, PasswordCheckState>(
      builder: (context, state) {
        return TextFormField(
          controller: _controller,
          onChanged: (value) =>
              passwordBloc.add(DoubleCheck(passwordCheck: value)),
          obscureText: hidePassword,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            labelText: '비밀번호 확인',
            prefixIcon: getCheckIcon(state),
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
          keyboardType: TextInputType.visiblePassword,
        );
      },
      listener: (context, state) {},
    );
  }
}
