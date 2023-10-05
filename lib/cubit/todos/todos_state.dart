import 'package:equatable/equatable.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/form_status.dart';

class TodosState extends Equatable {
  final FormStatus status;
  final List<EventModel> todos;
  final String error;
  final String eventName;
  final String eventDescription;
  final String eventTime;
  final String eventPriority;
  final String eventLocation;

  factory TodosState.initial() {
    return const TodosState(
      status: FormStatus.pure,
      todos: [],
      error: "",
      eventName: "",
      eventDescription: "",
      eventLocation: "",
      eventPriority: "",
      eventTime: "",
    );
  }

  const TodosState({
    required this.status,
    required this.todos,
    required this.error,
    required this.eventName,
    required this.eventTime,
    required this.eventDescription,
    required this.eventLocation,
    required this.eventPriority,
  });

  @override
  List<Object?> get props => [status, todos, error];

  @override
  bool get stringify => true;

  TodosState copyWith({
    FormStatus? status,
    List<EventModel>? todos,
    String? error,
    EventModel? eventModel,
    String? eventPriority,
    String? eventName,
    String? eventTime,
    String? eventDescription,
    String? eventLocation,
  }) {
    return TodosState(
        status: status ?? this.status,
        todos: todos ?? this.todos,
        error: error ?? this.error,
        eventPriority: eventPriority ?? this.eventPriority,
        eventName: eventName ?? this.eventName,
        eventTime: eventTime ?? this.eventTime,
        eventDescription: eventDescription ?? this.eventDescription,
        eventLocation: eventLocation ?? this.eventLocation);
  }
}
