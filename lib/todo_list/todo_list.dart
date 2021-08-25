import 'package:faker/faker.dart';
import 'package:todo_app/todo_item/todo_item.dart';

class TodoList {
  String name;
  bool isSelected;
  List<TodoItem> _items;

  List<TodoItem> get items => _items;

  TodoList({
    required this.name,
    this.isSelected = false,
    List<TodoItem>? items,
  }) : _items = items ?? [];

  void add(TodoItem item) {
    if (item.title.isEmpty) return;
    _items.add(item);
  }

  void delete(TodoItem item) {
    _items.remove(item);
  }

  void toggle(TodoItem item, bool? newValue) {
    item.isDone = newValue ?? false;
  }

  void edit(TodoItem oldItem, TodoItem newItem) {
    oldItem.edit(newItem);
  }

  /// this is for debugging only
  TodoList.random()
      : name = faker.lorem.word(),
        isSelected = false,
        _items = List<TodoItem>.generate(10, (i) => TodoItem.random());

  @override
  String toString() {
    return '{name=$name, isSelected=$isSelected}';
  }
}
