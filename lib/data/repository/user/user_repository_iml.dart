import 'package:bloc_practice/data/data_providers/network/user/user_data_provider.dart';
import 'package:bloc_practice/data/data_providers/network/user/user_data_provider_iml.dart';
import 'package:bloc_practice/data/repository/user/user_repository.dart';
import 'package:bloc_practice/ui/user_list/model/user_list_response.dart';

class UserRepositoryIml extends UserRepository {
  late UserDataProvider _userDataProvider;

  UserRepositoryIml() {
    _userDataProvider = UserDataProviderIml();
  }

  @override
  Future<UserListResponse> getUserList({required int page}) async {
    var response = await _userDataProvider.getUserList(page: page);
    return UserListResponse.fromJson(response);
  }
}
