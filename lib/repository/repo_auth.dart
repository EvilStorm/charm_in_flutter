import 'package:charmin/constants/signed_type.dart';
import 'package:charmin/network/api_client.dart';
import 'package:charmin/network/app_exception.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  static final AuthRepository _client = AuthRepository._internal();
  factory AuthRepository() {
    return _client;
  }
  AuthRepository._internal();

  Future<Response> signUp(
      String firebaseId, String email, SignedType type) async {
    Map<String, dynamic> body = {
      "firebaseId": firebaseId,
      "email": email,
      "joinType": type.type,
    };

    try {
      final response = await ApiClient().post("/api/v1/user", body: body);
      return response;
    } on AppException {
      rethrow;
    } on DioError catch (dio) {
      throw FetchDataException(dio.message, dio);
    } catch (e) {
      throw UnExpectedException("Error", e);
    }
  }

  Future<Response> signIn(int userCmmnSnm, int userSn) async {
    Map<String, dynamic> body = {
      "userCmmnSn": userCmmnSnm,
      "userSn": userSn,
    };

    try {
      final response =
          await ApiClient().post("/api/user/v1/signin", body: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Response>> userInfo(int userCmmnSnm) async {
    Map<String, dynamic> params = {
      "userCmmnSn": userCmmnSnm,
    };

    try {
      final resp = await Future.wait([
        ApiClient().get("/api/my/v1/profile", queryParam: params),
        ApiClient().get("/api/user/v1/commInfo", queryParam: params)
      ]);
      // final profResp =
      //     await ApiClient().get("/api/my/v1/profile", queryParam: params);
      // final commResp =
      //     await ApiClient().get("/api/user/v1/commInfo", queryParam: params);

      return resp;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> refreshToken() async {
    try {
      final response = await ApiClient().post("/api/user/v1/refresh");
      return response;
    } catch (e) {
      rethrow;
    }
  }
  // Future<Response> signInWithToken(String token) async {
  //   Map<String, dynamic> body = {
  //     "token": token,
  //   };

  //   try {
  //     final response =
  //         await ApiClient().post("/api/user/v1/signin", body: body);
  //     return response;
  //   } on AppException {
  //     rethrow;
  //   } on DioError catch (dio) {
  //     throw FetchDataException(dio.message, dio);
  //   } catch (e) {
  //     throw UnExpectedException("Error", e);
  //   }
  // }
}
