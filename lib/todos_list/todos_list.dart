import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todos_bloc/todos_bloc.dart';
import 'package:todo_app/todos_bloc/todos_state.dart';
import 'package:todo_app/todos_list/todo_list_item.dart';

class TodosList extends StatelessWidget {
  // final List<TodoItem> items = List.generate(
  //   20,
  //   (i) => TodoItem(
  //     title: faker.lorem.word(),
  //     description: faker.lorem.sentence(),
  //     isDone: Random().nextBool(),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BlocBuilder<TodosBloc, TodosState>(
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
