import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/main_screen/main_screen.dart';
import 'package:todo_app/todos_bloc/todos_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TodosBloc _bloc = TodosBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosBloc>.value(
      value: _bloc,
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
