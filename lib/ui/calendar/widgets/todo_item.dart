import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';
import 'package:todo_task/utils/size_extantion.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.c_009FEE,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: AppColors.c_C6E6F6),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Watching Football ",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff056ea2),
                    height: 21 / 14,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Text(
                  "Manchester United vs Arsenal (Premiere League)",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff056ea2),
                    height: 12 / 8,
                  ),
                  textAlign: TextAlign.left,
                ),
                10.ph,
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.timeIcon),
                    4.pw,
                    const Text(
                      "17:00 - 18:30",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff056ea2),
                        height: 15 / 10,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    10.pw,
                    SvgPicture.asset(AppIcons.location),
                    4.pw,
                    const Text(
                      "Stamford Bridge",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff056ea2),
                        height: 15 / 10,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
