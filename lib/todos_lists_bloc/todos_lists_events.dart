import 'package:todo_app/todo_list/todo_list.dart';

abstract class TodosListsEvent {}

class TodosSelectEvent implements TodosListsEvent {
  TodoList list;
  TodosSelectEvent({required this.list});
}

class TodosAddEvent implements TodosListsEvent {
  TodoList list;
  TodosAddEvent({required this.list});
}

class TodosDeleteEvent implements TodosListsEvent {
  TodoList list;
  TodosDeleteEvent({required this.list});
}

class TodosRefreshEvent implements TodosListsEvent {}
// class TodosAddEvent implements TodosListsEvent {}
