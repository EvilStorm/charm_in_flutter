import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/password/bloc_password.dart';
import 'package:charmin/bloc/password/event_password.dart';
import 'package:charmin/bloc/password/state_password.dart';
import 'package:charmin/constants/constants.dart';
import 'package:charmin/router/sign/widgets/display_password_validation.dart';
import 'package:charmin/router/sign/widgets/field_password.dart';
import 'package:charmin/store/store_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInBox extends StatelessWidget {
  SignInBox({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    PasswordBloc passwordBloc = BlocProvider.of<PasswordBloc>(context);
    return Column(
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
          height: sapceGap * 2,
        ),
        const PasswordField(),
        const SizedBox(
          height: sapceGap,
        ),
        PasswordValidation(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => context.push("/signIn/signUp"),
              child: Text(
                "회원가입",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ColorStore.textBasicSubColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: sapceGap * 2,
            ),
            TextButton(
              onPressed: () => context.push("/signIn/findPwd"),
              child: Text(
                "비밀번호 찾기",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ColorStore.textBasicSubColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              width: sapceGap * 2,
            ),
          ],
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
                authBloc.add(EmailSignInEvent(
                    email: emailController.text,
                    password: passwordBloc.password ?? ""));
              },
              child: const Text("로그인"),
            ),
          ),
        ),
      ],
    );
  }
}
