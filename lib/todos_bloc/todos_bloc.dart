import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todos_bloc/todos_events.dart';
import 'package:todo_app/todos_bloc/todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosState());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodoAddEvent) {
      state.add(event.item);
    }
    if (event is TodoCheckEvent) {
      state.check(event.item, event.newValue);
    }
    if (event is TodoEditEvent) {
      state.edit(event.oldItem, event.newItem);
    }
    if (event is TodoDeleteEvent) {
      state.delete(event.item);
    }

    yield state.copy();
  }
}
