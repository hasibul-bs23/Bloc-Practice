import 'package:bloc_practice/ui/user_list/model/user_list_response.dart';

abstract class UserRepository {
  Future<UserListResponse> getUserList({required int page});
}
