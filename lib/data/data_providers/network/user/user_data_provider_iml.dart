import 'package:bloc_practice/data/data_providers/network/user/user_data_provider.dart';
import 'package:bloc_practice/utils/api.dart';
import 'package:dio/dio.dart';

class UserDataProviderIml extends UserDataProvider {
  @override
  Future<dynamic> getUserList({required int page}) async {
    var response = await Dio().get("$API_USER_LIST$page");
    return response.data;
  }
}
