import 'package:charmin/bloc/app_version/bloc_app_version.dart';
import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/bloc/fetch_state.dart';
import 'package:charmin/components/fcm.dart';
import 'package:charmin/repository/repo_app_version.dart';
import 'package:charmin/repository/repo_auth.dart';
import 'package:charmin/utils/print.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:charmin/firebase_options.dart';
import 'package:charmin/router.dart';
import 'package:charmin/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessage().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppVersionBloc(
            appVerRepository: AppVersionRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: AuthRepository(),
          ),
        ),
      ],
      child: BlocListener<AuthBloc, FetchState>(
        listener: (context, state) {
          if (state is SignedIn) {
            Print.e(" Signed IN");
            context.push("/main");
          } else if (state is SignedOut) {
            context.push("/signIn");
            Print.e(" Signed OUT");
          }
        },
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: Themes.lightTheme,
          routerConfig: router,
        ),
      ),
    );
  }
}
