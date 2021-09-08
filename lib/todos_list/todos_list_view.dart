import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/add_todo_list_dialog.dart';
import 'package:todo_app/todo_list/todo_list.dart';
import 'package:todo_app/todos_list/todos_list_item.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_bloc.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_events.dart';
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
              Expanded(
                child: ListView(
                  children: [
                    ...state.lists
                        .map((list) => TodosListItem(list: list))
                        .toList(),
                    ListTile(
                      title: Text('Add List'),
                      trailing: Icon(Icons.add),
                      onTap: () {
                        showDialog<TodoList>(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AddTodoListDialog();
                            }).then((list) {
                          if (list == null) return;
                          BlocProvider.of<TodosListsBloc>(context).add(
                            TodosAddEvent(list: list),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
