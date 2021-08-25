import 'package:todo_app/todo_item/todo_item.dart';

abstract class TodoEvent {}

class TodoAddEvent implements TodoEvent {
  final TodoItem item;

  TodoAddEvent({required this.item});
}

class TodoDeleteEvent implements TodoEvent {
  final TodoItem item;

  TodoDeleteEvent({required this.item});
}

class TodoCheckEvent implements TodoEvent {
  final TodoItem item;
  bool? newValue;

  TodoCheckEvent({required this.item, this.newValue});
}

class TodoEditEvent implements TodoEvent {
  final TodoItem oldItem;
  final TodoItem newItem;

  TodoEditEvent(this.oldItem, this.newItem);
}

class TodoRefreshEvent implements TodoEvent {}
