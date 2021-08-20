import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/add_todo_dialog.dart';
import 'package:todo_app/todo_item/todo_item.dart';
import 'package:todo_app/todos_bloc/todos_bloc.dart';
import 'package:todo_app/todos_bloc/todos_events.dart';
import 'package:todo_app/todos_list/todos_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // drawer: _buildDrawer(),
      floatingActionButton: _buildFAB(context),
      body: TodosList(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('My Todo App'),
    );
  }

  Widget _buildDrawer() {
    return Drawer();
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // add new todo
        showDialog<TodoItem>(
          context: context,
          barrierDismissible: false,
          builder: (context) => AddTodoDialog(),
        ).then(
          (item) {
            if (item == null) return;
            BlocProvider.of<TodosBloc>(context).add(
              TodoAddEvent(
                item: item,
              ),
            );
          },
        );
      },
    );
  }
}
