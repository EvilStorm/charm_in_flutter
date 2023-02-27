import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/constants/constants.dart';
import 'package:charmin/store/store_color.dart';
import 'package:charmin/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FindPasswordRoute extends StatelessWidget {
  FindPasswordRoute({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
    bool isEnable = true;
    String countDown = "0";

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "비밀번호 찾기",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(sapceGap),
          child: Column(
            children: [
              const SizedBox(
                height: sapceGap * 5,
              ),
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
              BlocConsumer<AuthBloc, AuthState>(
                builder: (_, state) {
                  if (state is PasswordChangeEnableState) {
                    isEnable = state.can;
                  }
                  if (state is RetryTimer) {
                    isEnable = false;
                    countDown = state.time;
                  }
                  if (state is ErrorHasMesasge) {
                    isEnable = true;
                  }
                  return Column(
                    children: [
                      Visibility(
                          visible: !isEnable,
                          child: Padding(
                            padding: const EdgeInsets.only(left: sapceGap * 2),
                            child: Text('비밀번호 변경 메일이 발송되었습니다.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: ColorStore.primaryColor)),
                          )),
                      const SizedBox(
                        height: sapceGap * 2,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!isEnable) return;
                            bloc.add(
                                FindPasswordEvent(email: emailController.text));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: sapceGap * 2),
                            child: Text(isEnable ? '비밀번호 변경' : countDown),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                listener: (context, state) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//비밀번호 변경 메일을 전송합니다. 다소 시간이 걸릴 수 있습니다.