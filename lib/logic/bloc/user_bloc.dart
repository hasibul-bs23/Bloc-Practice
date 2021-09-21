import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/data/repository/user/user_repository.dart';
import 'package:bloc_practice/di/locator/locator.dart';
import 'package:bloc_practice/ui/user_list/model/user_list_response.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository = locator.get<UserRepository>();

  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUserList) {
      yield Loading();
      try {
        UserListResponse userListResponse =
            await userRepository.getUserList(page: event.page);
        if (userListResponse.data != null) {
          yield GetUserListSuccess(userList: userListResponse.data!);
        }
      } catch (e) {
        print(e);
        yield GetUserListFailed();
      }
    }
  }
}
