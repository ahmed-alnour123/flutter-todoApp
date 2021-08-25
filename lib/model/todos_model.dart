import 'package:todo_app/todo_item/todo_item.dart';
import 'package:todo_app/todo_list/todo_list.dart';

/* do something to _currentIndex and list.isSelected, it is messy */

class TodosModel {
  late List<TodoList> _todosLists;
  late int _currentIndex;
  List<RefreshBloc> _blocs = [];

  List<TodoList> get lists => _todosLists;
  TodoList get currentList => _todosLists[_currentIndex];
  int get currentIndex => _currentIndex;

  TodosModel() {
    _todosLists = getLists(); // TODO: read it from DB
    _currentIndex = _todosLists.indexWhere((list) => list.isSelected);
  }

  void add(TodoItem item) {
    currentList.add(item);
  }

  void delete(TodoItem item) {
    currentList.delete(item);
  }

  void toggle(TodoItem item, bool? newValue) {
    currentList.toggle(item, newValue);
  }

  void edit(TodoItem oldItem, TodoItem newItem) {
    currentList.edit(oldItem, newItem);
  }

  void select(TodoList list) {
    _todosLists.firstWhere((list) => list.isSelected).isSelected = false;
    list.isSelected = true;
    _currentIndex = _todosLists.indexOf(list);
    refreshBlocs();
  }

  List<TodoList> getLists() {
    return List.generate(5, (i) => TodoList.random())..first.isSelected = true;
  }

  void addBloc(RefreshBloc bloc) => _blocs.add(bloc);

  void refreshBlocs() {
    _blocs.forEach((bloc) => bloc.refresh());
  }
}

abstract class RefreshBloc {
  void refresh();
}
