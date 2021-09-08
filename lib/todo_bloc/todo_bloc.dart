import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todos_model.dart';
import 'package:todo_app/todo_bloc/todo_events.dart';
import 'package:todo_app/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> implements RefreshBloc {
  TodoBloc({required this.model}) : super(TodoState(list: model.currentList)) {
    model.addBloc(this);
  }

  final TodosModel model;

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is TodoAddEvent) {
      model.addItem(event.item);
    } else if (event is TodoCheckEvent) {
      model.toggleItem(event.item, event.newValue);
    } else if (event is TodoEditEvent) {
      model.editItem(event.oldItem, event.newItem);
    } else if (event is TodoDeleteEvent) {
      model.deleteItem(event.item);
    } else if (event is TodoRefreshEvent) {
      // no need to do anything
    }

    yield TodoState(list: model.currentList);
  }

  @override
  void refresh() {
    add(TodoRefreshEvent());
  }
}
