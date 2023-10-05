import 'package:equatable/equatable.dart';
import 'package:todo_task/utils/form_status.dart';

class TodoState extends Equatable {
  const TodoState({
    this.status = FormStatus.pure,
    this.errorText = '',
    this.eventTime = '',
    this.eventName = '',
    this.eventLocation = '',
    this.eventDescription = '',
    this.eventPriority = '',
  });

  final String eventName;
  final String eventDescription;
  final FormStatus status;
  final String errorText;
  final String eventLocation;
  final String eventTime;
  final String eventPriority;

  TodoState copyWith({
    String? eventName,
    String? eventDescription,
    FormStatus? status,
    String? errorText,
    String? eventLocation,
    String? eventTime,
    String? eventPriority,
  }) =>
      TodoState(
        eventName: eventName ?? this.eventName,
        eventDescription: eventDescription ?? this.eventDescription,
        status: status ?? this.status,
        eventLocation: eventLocation ?? this.eventLocation,
        eventTime: eventTime ?? this.eventTime,
        eventPriority: eventPriority ?? this.eventPriority,
        errorText: errorText ?? this.errorText,
      );

  @override
  String toString() {
    return '''
    eventName: $eventName
    eventDescription: $eventDescription
    eventLocation: $eventLocation
    eventTime: $eventTime
    eventPriority: $eventPriority
    errorText: $errorText
    ''';
  }

  @override
  List<Object?> get props => [
        eventPriority,
        eventTime,
        eventLocation,
        eventDescription,
        eventName,
        status,
        errorText,
      ];
}
