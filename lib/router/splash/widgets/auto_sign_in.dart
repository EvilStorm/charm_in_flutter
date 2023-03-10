import 'package:charmin/bloc/app_start/bloc_app_start.dart';
import 'package:charmin/bloc/app_start/event_app_start.dart';
import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoSignIn extends StatelessWidget {
  const AutoSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.stream.listen((event) {
      final appStartBloc = BlocProvider.of<AppStartBloc>(context);
      if (event is SignedIn) {
        appStartBloc.add(CheckedSignEvent(isSuccess: true));
      } else {
        appStartBloc.add(CheckedSignEvent(isSuccess: false));
      }
    });

    return const SizedBox.shrink();
  }
}
