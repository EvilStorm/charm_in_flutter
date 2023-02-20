import 'package:charmin/bloc/app_start/bloc_app_start.dart';
import 'package:charmin/router/home/route_home.dart';
import 'package:charmin/router/sign/route_sign_in.dart';
import 'package:charmin/router/sign/route_sign_up.dart';
import 'package:charmin/router/splash/route_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => BlocProvider(
        create: (context) => AppStartBloc(),
        child: SplashRoute(),
      ),
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) => const HomeRoute(),
    ),
    GoRoute(
        path: "/signUp",
        builder: (context, state) => const SignUpRoute(),
        routes: [
          GoRoute(
            path: "signIn",
            builder: (context, state) => const SignInRoute(),
          ),
        ]),
  ],
  debugLogDiagnostics: true,
  routerNeglect: true,
);

  // GoRoute(
  //   path: "/detail/:cmtyNttSn",
  //   builder: (context, state) => BlocProvider(
  //     create: (context) => FeedDetailBloc(repository: FeedRepository()),
  //     child: DetailScreen(cmtyNttSn: state.params['cmtyNttSn']!),
  //   ),
  // ),

