import 'package:charmin/bloc/app_start/bloc_app_start.dart';
import 'package:charmin/bloc/app_start/event_app_start.dart';
import 'package:charmin/bloc/app_start/state_app_start.dart';
import 'package:charmin/bloc/app_version/bloc_app_version.dart';
import 'package:charmin/bloc/app_version/event_app_version.dart';
import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/constants/exception_handler.dart';
import 'package:charmin/repository/repo_app_version.dart';
import 'package:charmin/router/splash/widgets/app_version.dart';
import 'package:charmin/router/splash/widgets/auto_sign_in.dart';
import 'package:charmin/router/splash/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashRoute extends StatelessWidget with ExceptionHandler {
  SplashRoute({super.key});

  void _readyStart(BuildContext context, AppStartBloc bloc) {
    bloc.stream.listen(
      (state) {
        if (state is StartMain) {
          context.go('/main');
        } else if (state is StartSignIn) {
          context.go('/signIn');
        }
      },
    );
  }

  void _waitAutoSigned(BuildContext context, AuthBloc bloc) {
    bloc.stream.listen((event) {
      final appStartBloc = BlocProvider.of<AppStartBloc>(context);
      if (event is SignedIn) {
        appStartBloc.add(CheckedSignEvent(isSuccess: true));
      } else {
        appStartBloc.add(CheckedSignEvent(isSuccess: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appStartBloc = BlocProvider.of<AppStartBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    _readyStart(context, appStartBloc);
    _waitAutoSigned(context, authBloc);

    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AppVersionBloc(
                appVerRepository: AppVersionRepository(),
              )..add(AppVerCheckUpdateEvent()),
            ),
          ],
          child: Container(
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: const [
                Splash(),
                Center(child: AppVersion()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
