import 'package:charmin/bloc/app_version/event_app_version.dart';
import 'package:charmin/bloc/app_version/state_app_version.dart';
import 'package:charmin/bloc/fetch_event.dart';
import 'package:charmin/bloc/fetch_response.dart';
import 'package:charmin/bloc/fetch_state.dart';
import 'package:charmin/components/shared_pref.dart';
import 'package:charmin/constants/save_key_store.dart';
import 'package:charmin/models/model_app_version.dart';
import 'package:charmin/repository/repo_app_version.dart';
import 'package:charmin/utils/os.dart';
import 'package:charmin/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionBloc extends Bloc<FetchEvent, FetchState> {
  late AppVersionRepository appVerRepository;
  AppVersionBloc({
    required this.appVerRepository,
  }) : super(Empty()) {
    on<AppVerLatestEvent>(_reqCurrentAppVer);
    on<AppVerCheckUpdateEvent>(_appUpdateCheck);
    on<SkipThisVerEvent>(_skipVersion);
  }

  void _skipVersion(SkipThisVerEvent event, Emitter<FetchState> emit) {
    SharedPref().setInt(SaveKeyStore.appSkipVersion, event.versionNumber);
    emit(LastedVersion());
  }

  Future<int> _getCurrentAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int packageVer = int.parse(packageInfo.buildNumber);
    int skipVer = await SharedPref().getInt(SaveKeyStore.appSkipVersion);
    if (packageVer > skipVer) {
      return packageVer;
    }
    return skipVer;
  }

  void _appUpdateCheck(
      AppVerCheckUpdateEvent event, Emitter<FetchState> emit) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    try {
      Response resp = await appVerRepository.reqUpdateCheck(
          await _getCurrentAppVersion(), getPlatormSymbol());

      if (resp.data['code'] != 200) {
        emit(LastedVersion());
        return;
      }

      AppVersionModel model = AppVersionModel.fromJson(resp.data['data']);

      emit(HasNewVersion(
        response: FetchResponse(stateCode: resp.statusCode!, model: model),
      ));
    } on Exception catch (e) {
      Print.e(e);
      emit(Error(message: e.toString(), e: e));
    }
  }

  void _reqCurrentAppVer(
      AppVerLatestEvent event, Emitter<FetchState> emit) async {
    emit(Loaded());

    try {
      Response resp = await appVerRepository.getCurrentVersion();
      AppVersionModel model = AppVersionModel.fromJson(resp.data['data']);
      emit(HasNewVersion(
        response: FetchResponse(stateCode: resp.statusCode!, model: model),
      ));
    } on Exception catch (e) {
      Print.e(e);
      emit(Error(message: e.toString(), e: e));
    }
  }
}
