import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/ui/calendar/widgets/calendar.dart';
import 'package:todo_task/ui/calendar/widgets/schedule_item.dart';
import 'package:todo_task/ui/calendar/widgets/todo_item.dart';
import 'package:todo_task/utils/app_icons.dart';
import 'package:todo_task/utils/size_extantion.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 72,
        title: Column(
          children: [
            const Text(
              "Sunday",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff292929),
                height: 21 / 14,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "28 September 2021",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff292929),
                      height: 15 / 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  4.pw,
                  SvgPicture.asset(AppIcons.arrowBottom)
                ],
              ),
            )
          ],
        ),
        actions: [SvgPicture.asset(AppIcons.notification), 28.pw],
      ),
      body: ListView(
        children: [
          36.ph,
          // const MonthItem(),
          // 19.ph,
          // const WeekDays(),
          // 19.ph,
          CustomCalendarDate(
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2950),
              onDateChanged: (v) {}),
          ScheduleItem(onTap: (){},),
          18.ph,
          ...List.generate(
            3,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: TodoItem(
                title: "Watching Football ",
                subTitle: "Manchester United vs Arsenal (Premiere League)",
                time: "17:00 - 18:30",
              ),
            ),
          )
        ],
      ),
    );
  }
}
