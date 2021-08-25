import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/main_screen/main_screen.dart';
import 'package:todo_app/model/todos_model.dart';
import 'package:todo_app/todo_bloc/todo_bloc.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TodosModel model = TodosModel();
  late final TodoBloc _todosBloc = TodoBloc(model: model);
  late final TodosListsBloc _todosListsBloc = TodosListsBloc(model: model);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>.value(value: _todosBloc),
        BlocProvider<TodosListsBloc>.value(value: _todosListsBloc),
      ],
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
