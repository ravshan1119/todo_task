import 'package:todo_task/data/local/local_database.dart';

import '../data/model/event_model.dart';

Future<List<EventModel>> getEventFromLocalDatabase() async {
  return await LocalDatabase.getAllTodos();
}

bool blueDot(String day, List<EventModel> events) {
  for (int i = 0; i < events.length; i++) {
    if (day == events[i].day && events[i].eventPriority == "Blue") {
      return true;
    }
  }
  return false;
}

bool redDot(String day, List<EventModel> events) {
  for (int i = 0; i < events.length; i++) {
    if (day == events[i].day && events[i].eventPriority == "Red") {
      return true;
    }
  }
  return false;
}

bool yellowDot(String day, List<EventModel> events) {
  for (int i = 0; i < events.length; i++) {
    if (day == events[i].day && events[i].eventPriority == "Orange") {
      return true;
    }
  }
  return false;
}
