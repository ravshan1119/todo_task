import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:todo_task/bloc/todo/todos_bloc.dart';
import 'package:todo_task/bloc/todo/todos_event.dart';
import 'package:todo_task/bloc/todo/todos_state.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/ui/app_routes.dart';
import 'package:todo_task/ui/todo_add/widgets/input.dart';
import 'package:todo_task/ui/todo_add/widgets/text_field_time.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';
import 'package:todo_task/utils/error_dialog.dart';
import 'package:todo_task/utils/form_status.dart';
import 'package:todo_task/utils/fuctions.dart';
import 'package:todo_task/utils/size_extantion.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({super.key, this.newEventModel});

  final EventModel? newEventModel;

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  String selectedColor = 'Red';
  List<String> colors = ['Red', 'Blue', 'Orange'];
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  final MaskTextInputFormatter maskFormatter = maskTimeFormatter;

  @override
  void initState() {
    if (widget.newEventModel != null) {
      eventTimeController.text = widget.newEventModel!.eventTime;
      eventDescriptionController.text = widget.newEventModel!.eventDescription;
      eventNameController.text = widget.newEventModel!.eventName;
      eventLocationController.text = widget.newEventModel!.eventLocation;
      selectedColor = widget.newEventModel!.eventPriority;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.white),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == FormStatus.failure) {
            if (state.status == FormStatus.failure) {
              errorDialog(context, state.statusText);
            }
          }
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
                    DropdownButton<String>(
                      value: selectedColor,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedColor = newValue!;
                        });
                      },
                      items:
                          colors.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 20,
                              width: 23,
                              color: value == "Red"
                                  ? AppColors.c_EE2B00
                                  : value == "Blue"
                                      ? AppColors.c_009FEE
                                      : AppColors.c_EE8F00,
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
                    TimeTextField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      maskTextInputFormatter: maskTimeFormatter,
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
                        if (widget.newEventModel == null &&
                            eventLocationController.text.isNotEmpty &&
                            eventNameController.text.isNotEmpty &&
                            eventDescriptionController.text.isNotEmpty &&
                            eventTimeController.text.isNotEmpty) {
                          const snackBar = SnackBar(
                            content: Text('Add Event!'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          context.read<TodosBloc>().add(
                                AddTodo(
                                  newTodo: EventModel(
                                      eventLocation:
                                          eventLocationController.text,
                                      eventName: eventNameController.text,
                                      eventPriority: selectedColor.toString(),
                                      eventDescription:
                                          eventDescriptionController.text,
                                      eventTime: eventTimeController.text,
                                      day:
                                          "${DateTime.now().day}.${DateTime.now().month}"),
                                ),
                              );

                          Navigator.pop(context);
                        } else if (eventLocationController.text.isNotEmpty &&
                            eventNameController.text.isNotEmpty &&
                            eventDescriptionController.text.isNotEmpty &&
                            eventTimeController.text.isNotEmpty) {
                          const snackBar = SnackBar(
                            content: Text('Event Updated!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          context.read<TodosBloc>().add(
                                UpdateTodo(
                                  updatedTodo: EventModel(
                                    id: widget.newEventModel!.id,
                                    eventLocation: eventLocationController.text,
                                    eventName: eventNameController.text,
                                    eventPriority: selectedColor.toString(),
                                    eventDescription:
                                        eventDescriptionController.text,
                                    eventTime: eventTimeController.text,
                                    day: widget.newEventModel!.day,
                                  ),
                                ),
                              );
                          Navigator.pushReplacementNamed(
                              context, RouteNames.calendar);
                        } else {
                          const snackBar = SnackBar(
                            content: Text('The field is not full!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                          child: Text(
                            widget.newEventModel == null ? "Add" : "Update",
                            style: const TextStyle(
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
