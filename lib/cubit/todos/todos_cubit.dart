import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/cubit/todos/todos_state.dart';
import 'package:todo_task/data/local/local_database.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/form_status.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosState.initial());

  Future<void> getTodos() async {
    if (state.todos.isNotEmpty) {
      emit(state.copyWith());
      return;
    }
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final List<EventModel> todos = await LocalDatabase.getAllTodos();
      emit(state.copyWith(
        status: FormStatus.success,
        todos: todos,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FormStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
