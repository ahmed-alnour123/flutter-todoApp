import 'package:todo_app/todo_item/todo_item.dart';

abstract class TodosEvent {}

class TodoAddEvent implements TodosEvent {
  final TodoItem item;

  TodoAddEvent({required this.item});
}

class TodoDeleteEvent implements TodosEvent {
  final TodoItem item;

  TodoDeleteEvent({required this.item});
}

class TodoCheckEvent implements TodosEvent {
  final TodoItem item;
  bool? newValue;

  TodoCheckEvent({required this.item, this.newValue});
}

class TodoEditEvent implements TodosEvent {
  final TodoItem oldItem;
  final TodoItem newItem;

  TodoEditEvent(this.oldItem, this.newItem);
}
