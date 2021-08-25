import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todo_bloc/todo_bloc.dart';
import 'package:todo_app/todo_bloc/todo_state.dart';
import 'package:todo_app/todo_list/todo_list_item_view.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          var unChecked = state.items
              .where((i) => !i.isDone)
              .map((i) => TodoListItem(item: i))
              .toList();

          var checked = state.items
              .where((i) => i.isDone)
              .map((i) => TodoListItem(item: i))
              .toList();

          return ListView(
            children: [
              if (unChecked.isNotEmpty)
                SizedBox(
                  height: 20,
                  child: Container(
                    color: Colors.grey[300],
                    child: Text('Ongoing Tasks'),
                  ),
                ),
              Column(
                children: unChecked,
              ),
              if (checked.isNotEmpty)
                SizedBox(
                  height: 20,
                  child: Container(
                    color: Colors.grey[300],
                    child: Text('Completed Tasks'),
                  ),
                ),
              Column(
                children: checked,
              ),
            ],
          );
        },
      ),
    );
  }
}
