import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todos_list/todos_list_item.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_bloc.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_state.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<TodosListsBloc, TodosListsState>(
        builder: (context, state) {
          return Column(
            children: [
              DrawerHeader(
                  child: FlutterLogo(
                size: 200,
                style: FlutterLogoStyle.stacked,
              )),
              ...state.lists.map((list) => TodosListItem(list: list)).toList(),
            ],
          );
        },
      ),
    );
  }
}
