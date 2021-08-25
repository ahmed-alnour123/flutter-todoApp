import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todo_list/todo_list.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_bloc.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_events.dart';

class TodosListItem extends StatelessWidget {
  TodosListItem({required this.list});

  final TodoList list;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(list.name),
        leading: list.isSelected ? Icon(Icons.check_circle_rounded) : null,
        onTap: () {
          BlocProvider.of<TodosListsBloc>(context).add(
            TodosSelectEvent(list: list),
          );
        },
      ),
    );
  }
}
