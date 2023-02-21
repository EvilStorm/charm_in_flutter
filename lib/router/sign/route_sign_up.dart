import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/bloc/password/bloc_password.dart';
import 'package:charmin/constants/constants.dart';
import 'package:charmin/router/sign/widgets/sign_up_box.dart';
import 'package:charmin/router/sign/widgets/thrid_party/widget_border_horizental.dart';
import 'package:charmin/router/sign/widgets/thrid_party/widget_btns_section.dart';
import 'package:charmin/router/widget/circular_progress.dart';
import 'package:charmin/store/store_color.dart';
import 'package:charmin/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpRoute extends StatelessWidget {
  SignUpRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
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
                        height: sapceGap * 4,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: ColorStore.primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      BlocProvider(
                        create: (context) => PasswordBloc(),
                        child: SizedBox(height: 300.0, child: SignUpBox()),
                      ),
                      const SizedBox(
                        height: sapceGap / 2,
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
              BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is Loading) {
                      return const Positioned.fill(
                        child: CircularProgress(),
                      );
                    } else if (state is ErrorHasMesasge) {
                      SnackBar snackBar = SnackBar(
                        duration: const Duration(milliseconds: 800),
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          state.message,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                        ),
                        backgroundColor: ColorStore.primaryColor,
                      );
                      SchedulerBinding.instance
                          .addPostFrameCallback((timeStamp) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    }
                    return SizedBox.shrink();
                  },
                  listener: (context, state) {}),
            ],
          ),
        ),
      ),
    );
  }
}
