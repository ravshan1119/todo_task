import 'package:flutter/material.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/ui/calendar/calendar_screen.dart';
import 'package:todo_task/ui/details/detail_screen.dart';
import 'package:todo_task/ui/todo_add/todo_add_screen.dart';

class RouteNames {
  static const String calendar = "/";
  static const String todoAdd = "/todo_add_screen";
  static const String detail = "/detail_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.calendar:
        return MaterialPageRoute(
          builder: (context) => const CalendarScreen(),
        );
      case RouteNames.todoAdd:
        return MaterialPageRoute(
          builder: (context) => const TodoAddScreen(),
        );
      case RouteNames.detail:
        return MaterialPageRoute(
          builder: (context) => DetailScreen(
            eventModel: EventModel(
              eventLocation: "",
              eventName: "",
              eventPriority: "",
              eventDescription: "",
              eventTime: "",
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not available!"),
            ),
          ),
        );
    }
  }
}
