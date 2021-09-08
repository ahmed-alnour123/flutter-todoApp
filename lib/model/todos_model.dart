import 'package:todo_app/todo_item/todo_item.dart';
import 'package:todo_app/todo_list/todo_list.dart';

/* do something to _currentIndex and list.isSelected, it is messy */

class TodosModel {
  late List<TodoList> _todosLists;
  late int _currentIndex;
  List<RefreshBloc> _blocs = [];

  // public getters
  List<TodoList> get lists => _todosLists;
  TodoList get currentList =>
      (0 <= _currentIndex && _currentIndex < _todosLists.length)
          ? _todosLists[_currentIndex]
          : TodoList(name: 'empty list');
  int get currentIndex => _currentIndex;

  TodosModel() {
    _todosLists = getLists(); // TODO: read it from DB
    _currentIndex = _todosLists.indexWhere((list) => list.isSelected);
  }

  // items functions
  void addItem(TodoItem item) {
    currentList.add(item);
  }

  void deleteItem(TodoItem item) {
    currentList.delete(item);
  }

  void toggleItem(TodoItem item, bool? newValue) {
    currentList.toggle(item, newValue);
  }

  void editItem(TodoItem oldItem, TodoItem newItem) {
    currentList.edit(oldItem, newItem);
  }

  // lists functions
  void selectList(TodoList list) {
    try {
      _todosLists.firstWhere((list) => list.isSelected).isSelected = false;
    } on StateError {}

    list.isSelected = true;
    _currentIndex = _todosLists.indexOf(list);
    refreshBlocs();
  }

  void addList(TodoList list) {
    _todosLists.add(list);
  }

  void deleteList(TodoList list) {
    _todosLists.remove(list);
    if (list.isSelected && _todosLists.isNotEmpty) {
      selectList(_todosLists.first);
    }
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
