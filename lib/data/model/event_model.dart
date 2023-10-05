import 'package:equatable/equatable.dart';
import 'package:todo_task/utils/form_status.dart';

class EventModel extends Equatable {
  int? id;
  final String eventName;
  final String eventDescription;
  final String eventLocation;
  final String eventTime;
  final String eventPriority;

  EventModel({
    this.id,
    required this.eventLocation,
    required this.eventName,
    required this.eventPriority,
    required this.eventDescription,
    required this.eventTime,
  });

  EventModel copyWith({
    int? id,
    String? eventName,
    String? eventDescription,
    FormStatus? status,
    String? eventLocation,
    String? eventTime,
    String? eventPriority,
  }) =>
      EventModel(
        id: id ?? this.id,
        eventName: eventName ?? this.eventName,
        eventDescription: eventDescription ?? this.eventDescription,
        eventLocation: eventLocation ?? this.eventLocation,
        eventTime: eventTime ?? this.eventTime,
        eventPriority: eventPriority ?? this.eventPriority,
      );

  @override
  String toString() {
    return '''
    eventName: $eventName
    eventDescription: $eventDescription
    eventLocation: $eventLocation
    eventTime: $eventTime
    eventPriority: $eventPriority
    ''';
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json[EventModelFields.id] as int? ?? 0,
      eventLocation: json[EventModelFields.eventLocation] as String? ?? "",
      eventTime: json[EventModelFields.eventTime] as String? ?? "",
      eventPriority: json[EventModelFields.eventPriority] as String? ?? "",
      eventDescription:
          json[EventModelFields.eventDescription] as String? ?? "",
      eventName: json[EventModelFields.eventName] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      EventModelFields.eventName: eventName,
      EventModelFields.eventDescription: eventDescription,
      EventModelFields.eventPriority: eventPriority,
      EventModelFields.eventLocation: eventLocation,
      EventModelFields.eventTime: eventTime,
    };
  }

  @override
  List<Object?> get props => [
        eventTime,
        eventPriority,
        eventLocation,
        eventDescription,
        eventName,
        id,
      ];
}

class EventModelFields {
  static const String id = "_id";
  static const String eventTime = "event_time";
  static const String eventPriority = "event_priority";
  static const String eventLocation = "event_location";
  static const String eventDescription = "event_description";
  static const String eventName = "event_name";

  static const String eventTable = "event_table";
}
