import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/cubit/todo/todo_cubit.dart';
import 'package:todo_task/cubit/todo/todo_state.dart';
import 'package:todo_task/data/local/local_database.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/ui/app_routes.dart';
import 'package:todo_task/ui/todo_add/widgets/drop_down.dart';
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
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state.status == FormStatus.loading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.failure) {
            if (state.status == FormStatus.failure) {
              errorDialog(context, state.errorText);
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
                      onChanged: (v) {
                        debugPrint(state.eventName);
                        state.copyWith(eventName: v.toString());
                      },
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
                      onChanged: (v) {
                        state.copyWith(eventDescription: v);
                      },
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
                      onChanged: (v) {
                        print(v);
                        state.copyWith(eventLocation: v);
                      },
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        child: SvgPicture.asset(AppIcons.location),
                      ),
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
                    6.ph,
                    const DropdownItem(),
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
                      onChanged: (v) {
                        state.copyWith(eventTime: v);
                      },
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
                        LocalDatabase.insertTodo(
                          EventModel(
                            eventLocation: eventLocationController.text,
                            eventName: eventNameController.text,
                            eventPriority: "easy",
                            eventDescription: eventDescriptionController.text,
                            eventTime: eventTimeController.text,
                          ),
                        );
                        Navigator.pushReplacementNamed(
                            context, RouteNames.calendar);

                        // context.read<TodoCubit>().addTodo(
                        //       context,
                        //       EventModel(
                        //         eventLocation: eventLocationController.text,
                        //         eventName: eventNameController.text,
                        //         eventPriority: "easy",
                        //         eventDescription:
                        //             eventDescriptionController.text,
                        //         eventTime: eventTimeController.text,
                        //       ),
                        //     );
                        // if (state.status == FormStatus.success) {
                        //   Navigator.pushReplacementNamed(
                        //       context, RouteNames.calendar);
                        // } else {
                        //   errorDialog(context, state.errorText);
                        // }
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
                            )),
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