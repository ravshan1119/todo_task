import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/bloc/todo/todos_bloc.dart';
import 'package:todo_task/bloc/todo/todos_event.dart';
import 'package:todo_task/data/model/event_model.dart';
import 'package:todo_task/ui/app_routes.dart';
import 'package:todo_task/ui/details/widgets/custom_app_bar.dart';
import 'package:todo_task/ui/details/widgets/description_item.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';
import 'package:todo_task/utils/size_extantion.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppIcons.arrowLeft),
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: eventModel.eventPriority == "Blue"
              ? AppColors.c_009FEE
              : eventModel.eventPriority == "Orange"
                  ? AppColors.c_EE8F00
                  : AppColors.c_EE2B00,
        ),
      ),
      body: Stack(
        children: [
          const DescriptionItem(),
          CustomAppBar(eventModel: eventModel),
          Positioned(
            bottom: 28,
            right: 28,
            left: 28,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.transparent)),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.c_FEE8E9,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    showAdaptiveDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            title: Text(
                              "Warning",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                height: 24 / 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            content: const Text(
                              "Do you really delete it?",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff7c7b7b),
                                height: 24 / 16,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  print(eventModel.id);
                                  context.read<TodosBloc>().add(
                                        DeleteTodo(todoId: eventModel.id!),
                                      );
                                  const snackBar = SnackBar(
                                    content: Text('Event Deleted!'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.pushReplacementNamed(
                                      context, RouteNames.calendar);
                                },
                                child: const Text(
                                  "YES",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff7c7b7b),
                                    height: 24 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "NO",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff7c7b7b),
                                    height: 24 / 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.delete,
                              colorFilter: ColorFilter.mode(
                                  AppColors.c_c02200, BlendMode.srcIn),
                            ),
                            2.pw,
                            Text(
                              "Delete Event",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c_292929,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
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
