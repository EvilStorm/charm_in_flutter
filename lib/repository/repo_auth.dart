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
      final response =
          await ApiClient.getInstance().post("/api/v1/user", body: body);
      return response;
    } on AppException {
      rethrow;
    } on DioError catch (dio) {
      throw FetchDataException(dio.message, dio);
    } catch (e) {
      throw UnExpectedException("Error", e);
    }
  }

  Future<Response> signIn(String firebaseId) async {
    Map<String, dynamic> body = {
      "firebaseId": firebaseId,
    };

    try {
      final response =
          await ApiClient.getInstance().post("/api/v1/user/signIn", body: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> signInToken() async {
    try {
      final response = await ApiClient.getInstance()
          .post("/api/v1/user/signIn/token", body: {});
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
        ApiClient.getInstance().get("/api/my/v1/profile", queryParam: params),
        ApiClient.getInstance().get("/api/user/v1/commInfo", queryParam: params)
      ]);
      // final profResp =
      //     await ApiClient.getInstance().get("/api/my/v1/profile", queryParam: params);
      // final commResp =
      //     await ApiClient.getInstance().get("/api/user/v1/commInfo", queryParam: params);

      return resp;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> refreshToken() async {
    try {
      final response =
          await ApiClient.getInstance().post("/api/user/v1/refresh");
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
  //         await ApiClient.getInstance().post("/api/user/v1/signin", body: body);
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
