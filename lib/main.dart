import 'package:bloc_practice/data/repository/user/user_repository_iml.dart';
import 'package:bloc_practice/logic/bloc/user_bloc.dart';
import 'package:bloc_practice/ui/user_list/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: UserRepositoryIml()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserListPage(title: 'Bloc practice'),
      ),
    );
  }
}
