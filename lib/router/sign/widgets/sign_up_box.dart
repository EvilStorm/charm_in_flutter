import 'package:charmin/constants/constants.dart';
import 'package:charmin/store/store_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpBox extends StatelessWidget {
  SignUpBox({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
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
              onPressed: () {},
              child: const Text("로그인"),
            ),
          ),
        ),
      ],
    );
  }
}
