import 'package:equatable/equatable.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/utils/form_status.dart';

class TodoState extends Equatable {
  const TodoState({
    required this.status,
    required this.todos,
    required this.statusText,
    this.eventPriority = "",
    this.eventLocation = "",
    this.eventDescription = "",
    this.eventTime = "",
    this.eventName = "",
  });

  final FormStatus status;
  final List<EventModel> todos;
  final String statusText;
  final String eventName;
  final String eventDescription;
  final String eventTime;
  final String eventLocation;
  final String eventPriority;

  TodoState copyWith({
    FormStatus? status,
    String? statusText,
    List<EventModel>? todos,
    String? eventName,
    String? eventDescription,
    String? eventLocation,
    String? eventTime,
    String? eventPriority,
  }) =>
      TodoState(
        status: status ?? this.status,
        todos: todos ?? this.todos,
        statusText: statusText ?? this.statusText,
        eventTime: eventTime ?? this.eventTime,
        eventName: eventName ?? this.eventName,
        eventDescription: eventDescription ?? this.eventDescription,
        eventLocation: eventLocation ?? this.eventLocation,
        eventPriority: eventPriority ?? this.eventPriority,
      );

  @override
  List<Object?> get props => [
        status,
        todos,
        eventPriority,
        eventLocation,
        eventDescription,
        eventName,
        eventTime
      ];
}
