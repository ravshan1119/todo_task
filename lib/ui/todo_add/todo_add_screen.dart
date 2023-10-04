import 'package:flutter/material.dart';
import 'package:todo_task/ui/todo_add/widgets/input.dart';
import 'package:todo_task/utils/size_extantion.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          16.ph,
          const Text(
            "Event name",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff111827),
              height: 20 / 14,
            ),
            textAlign: TextAlign.left,
          ),
          const TextField(
            decoration: InputDecoration(),
          ),
          16.ph,
          const TextField(
            maxLines: 4,
            // maxLength: 4,
            decoration: InputDecoration(),
          ),
          const GlobalTextField(hintText: "hintText")
        ],
      ),
    );
  }
}
