import 'package:flutter/material.dart';
import 'package:todo_task/ui/calendar/calendar_screen.dart';

class RouteNames {
  static const String calendar = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.calendar:
        return MaterialPageRoute(
          builder: (context) => const CalendarScreen(),
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
