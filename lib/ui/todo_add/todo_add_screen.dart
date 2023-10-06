import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/bloc/todo/todos_bloc.dart';
import 'package:todo_task/bloc/todo/todos_event.dart';
import 'package:todo_task/bloc/todo/todos_state.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/ui/app_routes.dart';
import 'package:todo_task/ui/todo_add/widgets/input.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';
import 'package:todo_task/utils/error_dialog.dart';
import 'package:todo_task/utils/form_status.dart';
import 'package:todo_task/utils/size_extantion.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key});

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  Color selectedColor = const Color(0xFFC6E6F6);
  List<Color> colors = [
    const Color(0xFFC6E6F6),
    const Color(0xFFF6CFC6),
    const Color(0xFFF6E3C6)
  ];
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<TodosBloc, TodoState>(
        listener: (context, state) {
          if (state.status == FormStatus.loading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.failure) {
            if (state.status == FormStatus.failure) {
              errorDialog(context, state.statusText);
            }
          }
        },
        builder: (context, state) {
          return Stack(
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
                      controller: eventNameController,
                      onChanged: (v) {
                        state.copyWith(eventName: v.toString());
                      },
                      hintText: "Event name",
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
                      controller: eventDescriptionController,
                      onChanged: (v) {
                        state.copyWith(eventDescription: v.toString());
                      },
                      hintText: "Event description",
                      maxLines: 5,
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
                      controller: eventLocationController,
                      onChanged: (v) {
                        state.copyWith(eventLocation: v.toString());
                      },
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        child: SvgPicture.asset(AppIcons.location),
                      ),
                      hintText: "Event location",
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
                    6.ph,
                    DropdownButton<Color>(
                      value: selectedColor,
                      onChanged: (newValue) {
                        setState(() {
                          selectedColor = newValue!;
                        });
                      },
                      items: colors.map<DropdownMenuItem<Color>>((Color color) {
                        return DropdownMenuItem<Color>(
                          value: color,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            child: Container(
                              width: 23,
                              height: 20,
                              color: color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    16.ph,
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
                      controller: eventTimeController,
                      onChanged: (v) {
                        state.copyWith(eventTime: v.toString());
                      },
                      hintText: "Event time",
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
                        debugPrint(state.eventPriority);
                        debugPrint(state.eventLocation);
                        debugPrint(state.eventDescription);
                        debugPrint(state.eventTime);
                        debugPrint(state.eventName);
                        // context.read<TodosBloc>().add(
                        //       AddTodo(
                        //         newTodo: EventModel(
                        //           eventLocation: eventLocationController.text,
                        //           eventName: eventNameController.text,
                        //           eventPriority: selectedColor.toString(),
                        //           eventDescription:
                        //               eventDescriptionController.text,
                        //           eventTime: eventTimeController.text,
                        //         ),
                        //       ),
                        //     );
                        debugPrint(
                          EventModel(
                            eventLocation: eventLocationController.text,
                            eventName: eventNameController.text,
                            eventPriority: selectedColor.toString(),
                            eventDescription: eventDescriptionController.text,
                            eventTime: eventTimeController.text,
                          ).toString(),
                        );
                        Navigator.pushReplacementNamed(
                            context, RouteNames.calendar);
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
