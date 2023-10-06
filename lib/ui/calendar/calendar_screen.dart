import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/bloc/todo/todos_bloc.dart';
import 'package:todo_task/bloc/todo/todos_event.dart';
import 'package:todo_task/bloc/todo/todos_state.dart';
import 'package:todo_task/ui/app_routes.dart';
import 'package:todo_task/ui/calendar/widgets/calendar.dart';
import 'package:todo_task/ui/calendar/widgets/schedule_item.dart';
import 'package:todo_task/ui/calendar/widgets/todo_item.dart';
import 'package:todo_task/ui/details/detail_screen.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';
import 'package:todo_task/utils/form_status.dart';
import 'package:todo_task/utils/size_extantion.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String day = DateTime.now().weekday == 0
      ? "Monday"
      : DateTime.now().weekday == 1
          ? "Tuesday"
          : DateTime.now().weekday == 2
              ? "Wednesday"
              : DateTime.now().weekday == 3
                  ? "Tuesday"
                  : DateTime.now().weekday == 4
                      ? "Friday"
                      : DateTime.now().weekday == 5
                          ? "Saturday"
                          : "Sunday";
  bool isVisible = true;

  @override
  void initState() {
    _getTodos();
    super.initState();
  }

  _getTodos() {
    context.read<TodosBloc>().add(GetTodo());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build calendar screen");
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 72,
        title: Column(
          children: [
            Text(
              day,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.c_292929,
                height: 21 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateTime.now().toString(),
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.c_292929,
                      height: 15 / 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  4.pw,
                  GestureDetector(
                    onTap: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                    child: isVisible
                        ? const Icon(Icons.keyboard_arrow_up)
                        : const Icon(Icons.keyboard_arrow_down),
                  )
                ],
              ),
            )
          ],
        ),
        actions: [SvgPicture.asset(AppIcons.notification), 28.pw],
      ),
      body: BlocBuilder<TodosBloc, TodoState>(
        builder: (context, state) {
          if(state.status == FormStatus.loading){
            const Center(child: CircularProgressIndicator(),);
          }
          return ListView(
            children: [
              36.ph,
              Visibility(
                visible: isVisible,
                child: CustomCalendarDate(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2950),
                    onDateChanged: (v) {
                      setState(() {
                        switch (v.weekday) {
                          case 0:
                            {
                              day = "Monday";
                            }
                            break;

                          case 1:
                            {
                              day = "Tuesday";
                            }
                            break;
                          case 2:
                            {
                              day = "Wednesday";
                            }
                            break;

                          case 3:
                            {
                              day = "Thursday";
                            }
                            break;
                          case 4:
                            {
                              day = "Friday";
                            }
                            break;
                          case 5:
                            {
                              day = "Saturday";
                            }
                            break;
                          case 6:
                            {
                              day = "Sunday";
                            }
                            break;

                          default:
                            {
                              //statements;
                            }
                            break;
                        }
                      });
                    }),
              ),
              ScheduleItem(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.todoAdd);
                },
              ),
              18.ph,
              ...List.generate(
                state.todos.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(eventModel: state.todos[index]),
                        ),
                      );
                    },
                    child: TodoItem(
                      textColor: state.todos[index].eventPriority == "Blue"
                          ? AppColors.c_056ea2
                          : state.todos[index].eventPriority == "Orange"
                              ? AppColors.c_b86e00
                              : AppColors.c_c02200,
                      subColor: state.todos[index].eventPriority == "Blue"
                          ? AppColors.c_C6E6F6
                          : state.todos[index].eventPriority == "Orange"
                              ? AppColors.c_F6E3C6
                              : AppColors.c_F6CFC6,
                      color: state.todos[index].eventPriority == "Blue"
                          ? AppColors.c_009FEE
                          : state.todos[index].eventPriority == "Orange"
                              ? AppColors.c_EE8F00
                              : AppColors.c_EE2B00,
                      title: state.todos[index].eventName,
                      subTitle: state.todos[index].eventDescription,
                      time: state.todos[index].eventTime,
                      location: state.todos[index].eventLocation,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
