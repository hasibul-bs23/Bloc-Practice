import 'package:bloc_practice/data/data_providers/network/user/user_data_provider.dart';
import 'package:bloc_practice/data/data_providers/network/user/user_data_provider_iml.dart';
import 'package:bloc_practice/data/repository/user/user_repository.dart';
import 'package:bloc_practice/data/repository/user/user_repository_iml.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<UserDataProvider>(UserDataProviderIml());
  locator.registerSingleton<UserRepository>(UserRepositoryIml());
}
