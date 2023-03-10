import 'package:charmin/bloc/password/bloc_password.dart';
import 'package:charmin/constants/constants.dart';
import 'package:charmin/router/sign/widgets/display_sign_state.dart';
import 'package:charmin/router/sign/widgets/box_sign_up.dart';
import 'package:charmin/router/sign/widgets/thrid_party/widget_border_horizental.dart';
import 'package:charmin/router/sign/widgets/thrid_party/widget_btns_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpRoute extends StatelessWidget {
  const SignUpRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "회원가입",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).backgroundColor,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: sapceGap),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: sapceGap * 5,
                      ),
                      BlocProvider(
                        create: (context) => PasswordBloc(),
                        child: SizedBox(height: 350.0, child: SignUpBox()),
                      ),
                      const SizedBox(
                        height: sapceGap * 2,
                      ),
                      const HorizentalBorder(),
                      const SizedBox(
                        height: sapceGap * 2,
                      ),
                      const ThirdPartySignInSection(
                        height: 100,
                      ),
                      const SizedBox(
                        height: sapceGap * 4,
                      ),
                    ],
                  ),
                ),
              ),
              const SignStateDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
