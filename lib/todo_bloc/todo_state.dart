import 'package:todo_app/todo_item/todo_item.dart';
import 'package:todo_app/todo_list/todo_list.dart';

class TodoState {
  TodoList list; // TODO: hide it

  String get name => list.name;
  List<TodoItem> get items => list.items;

  TodoState({required this.list});

  TodoState copy() => TodoState(list: list);
}
