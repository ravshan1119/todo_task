import 'package:equatable/equatable.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/form_status.dart';

class TodosState extends Equatable {
  final FormStatus status;
  final List<EventModel> todos;
  final String error;

  factory TodosState.initial() {
    return const TodosState(status: FormStatus.pure, todos: [], error: "");
  }

  const TodosState(
      {required this.status, required this.todos, required this.error});

  @override
  List<Object?> get props => [status, todos, error];

  @override
  bool get stringify => true;

  TodosState copyWith({
    FormStatus? status,
    List<EventModel>? todos,
    String? error,
  }) {
    return TodosState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      error: error ?? this.error,
    );
  }
}
