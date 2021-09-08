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
    if (item.title.isEmpty) return; // throw warning: you must have title
    item.orderIndex = _items.length; // assign the order index for new item
    _items.add(item);
    orderList();
  }

  void delete(TodoItem item) {
    _items.remove(item);
    orderList();
  }

  void toggle(TodoItem item, bool? newValue) {
    item.isDone = newValue ?? false;
  }

  void edit(TodoItem oldItem, TodoItem newItem) {
    oldItem.edit(newItem);
  }

  @override
  String toString() {
    return '{name=$name, isSelected=$isSelected}';
  }

  void orderList() {
    var i = 0;
    _items.sort(sortByindex);
    _items.forEach((item) {
      item.orderIndex = i++;
    });
  }

  int sortByindex(TodoItem i1, TodoItem i2) {
    return i1.orderIndex.compareTo(i2.orderIndex);
  }

  /// this is for debugging only TODO: remove
  TodoList.random()
      : name = faker.lorem.word(),
        isSelected = false,
        _items = List<TodoItem>.generate(5, (i) => TodoItem.random()) {
    orderList();
  }
}
