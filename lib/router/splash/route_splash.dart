import 'package:charmin/bloc/app_version/bloc_app_version.dart';
import 'package:charmin/bloc/app_version/event_app_version.dart';
import 'package:charmin/bloc/app_version/state_app_version.dart';
import 'package:charmin/bloc/auth/bloc_auth.dart';
import 'package:charmin/bloc/auth/event_auth.dart';
import 'package:charmin/bloc/auth/state_auth.dart';
import 'package:charmin/bloc/fetch_state.dart';
import 'package:charmin/constants/exception_handler.dart';
import 'package:charmin/models/model_app_version.dart';
import 'package:charmin/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashRoute extends StatelessWidget with ExceptionHandler {
  const SplashRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final appVersionBloc = BlocProvider.of<AppVersionBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    appVersionBloc.add(AppVerLatestEvent());

    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
          color: Theme.of(context).backgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: MultiBlocListener(
            listeners: [
              BlocListener<AppVersionBloc, FetchState>(
                listener: (context, state) {
                  if (state is CurrentAppVersionLoaded) {
                    Print.d(
                        'Version: ${(state.response.model as AppVersionModel).appVerCode}');
                  }
                },
              ),
              // BlocListener<AuthBloc, FetchState>(
              //   listener: (context, state) {
              //     if (state is SignedIn) {
              //       context.push("/main");
              //     } else if (state is SignedOut) {
              //       context.push("/signIn");
              //     }
              //   },
              // ),
            ],
            child: GestureDetector(
                onTap: () => authBloc.add(SignCheckEvent()),
                child: Text("MULTI!!")),
          ),
          // child: BlocConsumer<AppVersionBloc, FetchState>(
          //   listener: (context, state) {},
          //   builder: (context, state) {
          //     if (state is CurrentAppVersionLoaded) {
          //       authBloc.add(SignCheckEvent());
          //       return Column(
          //         children: [
          //           Text(
          //               'Version: ${(state.response.model as AppVersionModel).appVerCode}'),
          //         ],
          //       );
          //     } else if (state is Error) {
          //       SchedulerBinding.instance.addPostFrameCallback((_) =>
          //           fetchErrorHandler(
          //               context: context,
          //               exception: state.e,
          //               callback: () => Navigator.pop(context)));
          //     }
          //     return const Center(
          //       child: CircularProgressIndicator(
          //         strokeWidth: 5,
          //         color: Colors.amber,
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
