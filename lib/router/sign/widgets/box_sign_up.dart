import 'dart:ffi';

import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/password/bloc_password.dart';
import 'package:charmin/bloc/password/event_password.dart';
import 'package:charmin/bloc/password/state_password.dart';
import 'package:charmin/constants/constants.dart';
import 'package:charmin/router/sign/widgets/field_password_check.dart';
import 'package:charmin/router/sign/widgets/field_password.dart';
import 'package:charmin/router/sign/widgets/display_password_validation.dart';
import 'package:charmin/store/store_color.dart';
import 'package:charmin/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBox extends StatelessWidget {
  SignUpBox({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    PasswordBloc passwordBloc = BlocProvider.of<PasswordBloc>(context);
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: const InputDecoration(
                labelText: '이메일',
              ),
            ),
            const SizedBox(
              height: sapceGap * 3,
            ),
            const PasswordField(),
            const SizedBox(
              height: sapceGap,
            ),
            PasswordValidation(),
            const SizedBox(
              height: sapceGap,
            ),
            const PasswordCheckField(),
            const SizedBox(
              height: sapceGap / 2,
            ),
            const SizedBox(
              height: sapceGap * 4,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    authBloc.add(
                      EmailSignInEvent(
                          email: emailController.text,
                          password: passwordBloc.password ?? ""),
                    );
                  },
                  child: const Text("회원가입"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
