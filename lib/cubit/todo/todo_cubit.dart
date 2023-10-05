import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/cubit/todo/todo_state.dart';
import 'package:todo_task/data/local/local_database.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/error_dialog.dart';
import 'package:todo_task/utils/form_status.dart';
import 'package:todo_task/utils/loading_dialog.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  Future<void> addTodo(context, EventModel eventModel) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    if (canAddTodo().isEmpty) {
      await LocalDatabase.insertTodo(eventModel);
    } else {
      errorDialog(context, "Maydonlar toliq emas!");
    }

    hideLoading(context: context);

    emit(state.copyWith(status: FormStatus.success));
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
