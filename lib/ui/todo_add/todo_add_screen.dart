import 'package:flutter/material.dart';
import 'package:todo_task/ui/app_routes.dart';
import 'package:todo_task/ui/todo_add/widgets/input.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/size_extantion.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 19),
            child: ListView(
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
                4.ph,
                GlobalTextField(
                  hintText: "Event name",
                  controller: eventNameController,
                ),
                16.ph,
                const Text(
                  "Event description",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff111827),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                GlobalTextField(
                  hintText: "Event description",
                  maxLines: 5,
                  controller: eventDescriptionController,
                ),
                16.ph,
                const Text(
                  "Event location",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff111827),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                4.ph,
                GlobalTextField(
                  hintText: "Event location",
                  controller: eventLocationController,
                ),
                16.ph,
                const Text(
                  "Priority color",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff111827),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                54.ph,
                const Text(
                  "Event time",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff111827),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                4.ph,
                GlobalTextField(
                  hintText: "Event time",
                  controller: eventTimeController,
                ),
                150.ph,
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.transparent)),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.c_009FEE,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.detail);
                  },
                  child: const Center(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                        child: Text(
                          "Add",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 15 / 10,
                          ),
                          textAlign: TextAlign.left,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
