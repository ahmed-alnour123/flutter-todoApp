import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todo_item/todo_item.dart';
import 'package:todo_app/todo_item/todo_item_view.dart';
import 'package:todo_app/todos_bloc/todos_bloc.dart';
import 'package:todo_app/todos_bloc/todos_events.dart';

class TodoListItem extends StatelessWidget {
  final TodoItem item;

  const TodoListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(
            item.title,
            style: TextStyle(
              decoration: item.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          onTap: () {
            // go to new route
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return TodoItemView(
                  item: item,
                  bloc: BlocProvider.of<TodosBloc>(context),
                );
              }),
            );
          },
          onLongPress: () {
            // edit todo
          },
          leading: Checkbox(
            shape: CircleBorder(),
            onChanged: (bool? value) {
              // edit check
              BlocProvider.of<TodosBloc>(context).add(
                TodoCheckEvent(item: item, newValue: value),
              );
            },
            value: item.isDone,
          ),
          trailing: IconButton(
            onPressed: () {
              var bloc = BlocProvider.of<TodosBloc>(context);

              bloc.add(TodoDeleteEvent(item: item));
            },
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
