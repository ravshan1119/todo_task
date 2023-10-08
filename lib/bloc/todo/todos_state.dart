import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/form_status.dart';

class TodosState {
  TodosState({
    required this.todos,
    required this.eventDescription,
    required this.status,
    required this.eventPriority,
    required this.eventLocation,
    required this.eventName,
    required this.eventTime,
    required this.statusText,
  });

  final FormStatus status;
  final List<EventModel> todos;
  final String statusText;
  final String eventName;
  final String eventDescription;
  final String eventTime;
  final String eventLocation;
  final String eventPriority;

  TodosState copyWith({
    String? statusText,
    String? eventName,
    String? eventDescription,
    String? eventTime,
    String? eventLocation,
    String? eventPriority,
    FormStatus? status,
    List<EventModel>? todos,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
      eventDescription: eventDescription ?? this.eventDescription,
      status: status ?? this.status,
      eventPriority: eventPriority ?? this.eventPriority,
      eventLocation: eventLocation ?? this.eventLocation,
      eventName: eventName ?? this.eventName,
      eventTime: eventTime ?? this.eventTime,
      statusText: statusText ?? this.statusText,
    );
  }
}
