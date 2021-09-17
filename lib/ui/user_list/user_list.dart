import 'package:bloc_practice/data/repository/user/user_repository.dart';
import 'package:bloc_practice/data/repository/user/user_repository_iml.dart';
import 'package:bloc_practice/logic/bloc/user_bloc.dart';
import 'package:bloc_practice/ui/user_list/model/user_list_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatefulWidget {
  UserListPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<UserData> _userList = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetUserList(page: 1));
    UserRepository userRepository = UserRepositoryIml();

    userRepository.getUserList(page: 1).then((userListResponse) {
      setState(() {
        if (userListResponse.data != null) _userList = userListResponse.data!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (blocContext, state) {
          if (state is Loading) {
            return Center(child: Text("Loading..."));
          } else if (state is GetUserListSuccess) {
            return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                var user = state.userList[index];

                return _getUserItem(user);
              },
            );
          } else {
            return Text("No user found!");
          }
        },
      ),
    );
  }
}

Widget _getUserItem(UserData user) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    child: Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.avatar!),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${user.firstName} ${user.lastName}"),
                SizedBox(
                  height: 10.0,
                ),
                Text(user.email!),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
