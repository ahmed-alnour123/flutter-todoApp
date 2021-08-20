import 'dart:math';

import 'package:faker/faker.dart';
import 'package:todo_app/todo_item/todo_item.dart';

class TodosState {
  List<TodoItem> _items;

  List<TodoItem> get items => _items;

  TodosState([List<TodoItem>? items]) : _items = items ?? [];

  void add(TodoItem item) {
    if (item.title.isEmpty) return;
    _items.add(item);
  }

  void delete(TodoItem item) {
    _items.remove(item);
  }

  void check(TodoItem item, bool? newValue) {
    item.isDone = newValue ?? false;
  }

  void edit(TodoItem oldItem, TodoItem newItem) {
    oldItem.edit(newItem);
  }

  TodosState copy() {
    return TodosState(_items);
  }
}
