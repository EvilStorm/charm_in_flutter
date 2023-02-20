import 'dart:io';

import 'package:charmin/bloc/app_start/bloc_app_start.dart';
import 'package:charmin/bloc/app_start/event_app_start.dart';
import 'package:charmin/bloc/app_version/bloc_app_version.dart';
import 'package:charmin/bloc/app_version/event_app_version.dart';
import 'package:charmin/bloc/app_version/state_app_version.dart';
import 'package:charmin/bloc/fetch_state.dart';
import 'package:charmin/models/model_app_version.dart';
import 'package:charmin/router/widget/dialog_basic.dart';
import 'package:charmin/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  void _moveStore() {
    Print.i("스토어 이동");
  }

  void _passThisVersion(
      AppVersionBloc? bloc, AppStartBloc? appStartBloc, int versionCode) {
    bloc?.add(SkipThisVerEvent(versionNumber: versionCode));
    appStartBloc?.add(VersionCheckedEvent());
  }

  void _terminate() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppVersionBloc bloc = BlocProvider.of<AppVersionBloc>(context);
    AppStartBloc appStartBloc = BlocProvider.of<AppStartBloc>(context);

    return BlocConsumer<AppVersionBloc, FetchState>(
      builder: (context, state) {
        if (state is HasNewVersion<AppVersionModel>) {
          final data = state.response.model;
          return data!.isMustUpdate
              ? BasicDialog(
                  message: data.say,
                  leftBtnTitle: "종료",
                  leftBtnAction: _terminate,
                  rightBtnTitle: "스토어",
                  rightBtnAccent: true,
                  rightBtnAction: _moveStore,
                )
              : BasicDialog(
                  message: data.say,
                  leftBtnTitle: "취소",
                  leftBtnAction: () =>
                      _passThisVersion(bloc, appStartBloc, data.appVerCode),
                  rightBtnTitle: "스토어",
                  rightBtnAccent: true,
                  rightBtnAction: _moveStore,
                );
        }
        return const SizedBox.shrink();
      },
      listener: (context, state) {
        if (state is LastedVersion) {
          appStartBloc.add(VersionCheckedEvent());
        }
      },
    );
  }
}
