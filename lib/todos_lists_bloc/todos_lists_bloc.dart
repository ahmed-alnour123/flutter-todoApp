import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todos_model.dart';
import 'package:todo_app/todos_lists_bloc/todos_lists_state.dart';

import 'todos_lists_events.dart';

class TodosListsBloc extends Bloc<TodosListsEvent, TodosListsState>
    implements RefreshBloc {
  TodosListsBloc({required this.model})
      : super(TodosListsState(lists: model.lists)) {
    model.addBloc(this);
  }

  TodosModel model;

  @override
  Stream<TodosListsState> mapEventToState(TodosListsEvent event) async* {
    if (event is TodosSelectEvent) {
      model.selectList(event.list);
    } else if (event is TodosAddEvent) {
      model.addList(event.list);
    } else if (event is TodosDeleteEvent) {
      model.deleteList(event.list);
    } else if (event is TodosRefreshEvent) {
      // no need to do anything
    }

    yield TodosListsState(lists: model.lists);
  }

  @override
  void refresh() {
    add(TodosRefreshEvent());
  }
}
