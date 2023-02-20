import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/constants/constants.dart';
import 'package:charmin/store/store_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBox extends StatelessWidget {
  SignUpBox({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
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
        TextField(
          controller: passwordController,
          obscureText: true,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: const InputDecoration(
            labelText: '비밀번호',
          ),
        ),
        const SizedBox(
          height: sapceGap * 2,
        ),
        Padding(
          padding: const EdgeInsets.only(right: sapceGap * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "회원가입",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ColorStore.textBasicSubColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: sapceGap * 2,
              ),
              Text(
                "비밀번호 찾기",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ColorStore.textBasicSubColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
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
                    password: passwordController.text));
              },
              child: const Text("로그인"),
            ),
          ),
        ),
      ],
    );
  }
}
