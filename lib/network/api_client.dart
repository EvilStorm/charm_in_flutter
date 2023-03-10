import 'dart:collection';
import 'dart:io';

import 'package:charmin/network/api_info.dart';
import 'package:charmin/network/app_exception.dart';
import 'package:charmin/network/my_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final ApiClient _client = ApiClient._internal();
  late Dio _dio;

  // factory ApiClient() {
  //   return _client;
  // }

  factory ApiClient.getInstance() {
    return _client;
  }
  Dio getDioOriginal() {
    return _dio;
  }

  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: domain,
        contentType: "application/json",
        connectTimeout: 10 * 1000,
      ),
    )
      ..interceptors.add(DioInterceptor())
      ..interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
  }

  void addHeader(key, value) {
    _dio.options.headers[key] = value;
  }

  void addAuthorization(String token) {
    _dio.options.headers["authorization"] = token;
  }

  Future<Response> get(String url, {Map<String, dynamic>? queryParam}) async {
    try {
      Response result = await _dio.get(url, queryParameters: queryParam);
      return handleException(result);
    } on DioError catch (dio) {
      throw FetchDataException(dio.message, dio);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? queryParam, Map<String, dynamic>? body}) async {
    try {
      Response result =
          await _dio.post(url, data: body, queryParameters: queryParam);
      return handleException(result);
    } on DioError catch (dio) {
      if (dio.type == DioErrorType.other) {
        throw FatalException(
          "서버와 연결에 실했습니다. 잠시 후 다시 시도 해주세요.",
        );
      }
      throw FetchDataException(
          "${dio.response?.data['message']} ${dio.response?.data['reason']}",
          dio);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> request(
    String path, {
    Options? options,
    dynamic data,
    Map<String, dynamic>? parameter,
  }) async {
    try {
      Response result = await _dio.request(path,
          options: options, data: data, queryParameters: parameter);
      return handleException(result);
    } on DioError catch (dio) {
      throw FetchDataException(dio.message, dio);
    } catch (e) {
      rethrow;
    }
  }

  Response handleException(Response response) {
    if (response.statusCode == 405) {
      throw UnauthorisedException(" SignIn Again");
    }
    if (300 < (response.statusCode ?? 300)) {
      throw FetchDataException("State Code Over 300");
    }

    if ((response.data is! List) &&
        response.data['errorCode'] != null &&
        response.data['errorCode'] > 300) {
      if (response.data['errorCode'] == 403) {
        return response;
      }

      throw FetchInnerException(
          "Inner ErrorCode: ${response.data['errorCode']}");
    }

    return response;
  }
}
