import 'package:charmin/network/api_client.dart';
import 'package:dio/dio.dart';

class AppVersionRepository {
  static final AppVersionRepository _client = AppVersionRepository._internal();
  factory AppVersionRepository() {
    return _client;
  }
  AppVersionRepository._internal() {
    // getCurrentVersion();
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

  Future<Response> reqUpdateCheck(int versionCode, String os) async {
    try {
      final response =
          await ApiClient().get("/api/v1/appVer/after/$versionCode/$os");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCurrentVersion() async {
    try {
      final response = await ApiClient().get("/api/v1/appVer/latest");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
