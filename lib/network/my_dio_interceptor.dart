import 'dart:convert';

import 'package:charmin/components/shared_pref.dart';
import 'package:charmin/constants/save_key_store.dart';
import 'package:charmin/models/model_auth_token.dart';
import 'package:charmin/network/api_client.dart';
import 'package:charmin/network/api_info.dart';
import 'package:charmin/network/app_exception.dart';
import 'package:charmin/repository/repo_auth.dart';
import 'package:charmin/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (_checkRefreshTokenState(response: response)) {
      bool canRefresh = await _refreshToken();
      if (!canRefresh) {
        response.statusCode = 405;
        super.onResponse(response, handler);
        return;
      }
      handler.resolve(await _retry(response.requestOptions));
      return;
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // if (_checkRefreshTokenState(err: err)) {
    //   await _refreshToken();
    //   handler.resolve(await _retry(err.requestOptions));
    //   return;
    // }
    super.onError(err, handler);
  }

  bool _checkRefreshTokenState({Response? response, DioError? err}) {
    try {
      if (response?.data == null ||
          response!.data is List ||
          response.data?['errorCode'] == null) {
        return false;
      }
    } catch (e) {
      Print.e(e);
    }
    if (err?.response?.statusCode == 403) {
      return true;
    }
    if (response?.statusCode == 200 &&
        (response?.data?['errorCode'] == 403 ||
            response?.data?['errorCode'] == 401)) {
      return true;
    }
    return false;
  }

  Future<bool> _refreshToken() async {
    AuthRepository repository = AuthRepository();
    try {
      Dio dio = Dio();

      String? tokenStr =
          await SharedPref().getString(SaveKeyStore.authTokenKey);
      if (tokenStr == null) {
        throw UnauthorisedException("로그인 해주세요.");
      }

      AuthTokenModel? token = AuthTokenModel.fromJson(jsonDecode(tokenStr));

      if (token == null || token.refreshToken == null) {
        throw UnauthorisedException("로그인 해주세요.");
      }
      dio.options.headers['Authorization'] = token.refreshToken;

      Response resp = await dio.post('$domain/api/user/v1/refresh');
      if (resp.data['errorCode'] != null) {
        return false;
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthTokenModel> _saveAuthToken(type, access, refresh) async {
    AuthTokenModel authToken =
        AuthTokenModel(type: type, token: access, refreshToken: refresh);

    await SharedPref()
        .setString(SaveKeyStore.authTokenKey, authToken.toString());
    return authToken;
  }

  Future<Response> _retry(RequestOptions options) async {
    final opts = Options(method: options.method, headers: options.headers);

    final req = await ApiClient().request(options.path,
        options: opts, data: options.data, parameter: options.queryParameters);

    return req;
  }
}
