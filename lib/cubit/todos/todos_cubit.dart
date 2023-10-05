import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/cubit/todos/todos_state.dart';
import 'package:todo_task/data/local/local_database.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/form_status.dart';
import 'package:todo_task/utils/loading_dialog.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosState.initial());

  Future<void> addTodo(context, EventModel eventModel) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);

    await LocalDatabase.insertTodo(eventModel);

    hideLoading(context: context);

    emit(state.copyWith(status: FormStatus.success));
  }

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

  String canAddTodo() {
    if (state.eventName.isEmpty) {
      return "Event Name empty!";
    }
    if (state.eventDescription.isEmpty) {
      return "Event Description empty!";
    }
    if (state.eventLocation.isEmpty) {
      return "Event Location empty!";
    }
    if (state.eventPriority.isEmpty) {
      return "Event Priority empty!";
    }
    if (state.eventTime.isEmpty) {
      return "Event Time empty!";
    }

    return "";
  }
}
