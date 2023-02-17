import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
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
      builder: (context, state) => const SplashRoute(),
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
            path: "/signIn",
            builder: (context, state) => const SignInRoute(),
          ),
        ]),
  ],
  debugLogDiagnostics: true,
  routerNeglect: true,
  redirect: (context, state) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.stream.listen((event) {
      if (event is SignedOut) {
        return '/signUp';
      } else if (event is SignedIn) {
        return '/main';
      }
    });
  },
);

  // GoRoute(
  //   path: "/detail/:cmtyNttSn",
  //   builder: (context, state) => BlocProvider(
  //     create: (context) => FeedDetailBloc(repository: FeedRepository()),
  //     child: DetailScreen(cmtyNttSn: state.params['cmtyNttSn']!),
  //   ),
  // ),

