import 'package:flutter/material.dart';
import 'package:todo_task/utils/app_colors.dart';

class WeekDays extends StatelessWidget {
  const WeekDays({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sun",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.c_969696,
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Mon",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.c_969696,
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Tue",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.c_969696,
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Wed",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.c_969696,
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Thu",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.c_969696,
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Fri",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.c_969696,
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            "Sat",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.c_969696,
              height: 18 / 12,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
