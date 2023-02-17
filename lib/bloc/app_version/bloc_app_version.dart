import 'package:charmin/bloc/app_version/event_app_version.dart';
import 'package:charmin/bloc/app_version/state_app_version.dart';
import 'package:charmin/bloc/fetch_event.dart';
import 'package:charmin/bloc/fetch_response.dart';
import 'package:charmin/bloc/fetch_state.dart';
import 'package:charmin/models/model_app_version.dart';
import 'package:charmin/repository/repo_app_version.dart';
import 'package:charmin/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppVersionBloc extends Bloc<FetchEvent, FetchState> {
  late AppVersionRepository appVerRepository;
  AppVersionBloc({
    required this.appVerRepository,
  }) : super(Empty()) {
    on<AppVerLatestEvent>(_reqCurrentAppVer);
  }

  void _reqCurrentAppVer(
      AppVerLatestEvent event, Emitter<FetchState> emit) async {
    emit(Loaded());

    try {
      Response resp = await appVerRepository.getCurrentVersion();
      AppVersionModel model = AppVersionModel.fromJson(resp.data['data']);
      emit(CurrentAppVersionLoaded(
        response: FetchResponse(stateCode: resp.statusCode!, model: model),
      ));
    } on Exception catch (e) {
      Print.e(e);
      emit(Error(message: e.toString(), e: e));
    }
  }
}
