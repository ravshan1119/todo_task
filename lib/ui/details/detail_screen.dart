import 'package:flutter/material.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/ui/details/widgets/app_bar_custom.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarCustom(
        title: eventModel.eventName,
        subtitle: eventModel.eventDescription,
        image: "",
        onTap: () {},
        body: const Text("Nimadur"),
      ),
    );
  }
}
