import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/add_todo_dialog.dart';
import 'package:todo_app/todo_bloc/todo_bloc.dart';
import 'package:todo_app/todo_bloc/todo_events.dart';
import 'package:todo_app/todo_bloc/todo_state.dart';
import 'package:todo_app/todo_item/todo_item.dart';
import 'package:todo_app/todo_list/todo_list_view.dart';
import 'package:todo_app/todos_list/todos_list_view.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_bloc.dart';

class MainScreen extends StatelessWidget {
  late final TodosListsBloc listsBloc;

  @override
  Widget build(BuildContext context) {
    listsBloc = BlocProvider.of<TodosListsBloc>(context);

    return Scaffold(
      appBar: _buildAppBar(),
      drawer: TodosListView(),
      floatingActionButton: _buildFAB(context),
      body: TodoListView(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return Text(state.list.name);
        },
      ),
    );
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
            BlocProvider.of<TodoBloc>(context).add(
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
