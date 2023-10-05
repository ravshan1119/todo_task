import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_task/cubit/todo/todo_cubit.dart';
import 'package:todo_task/cubit/todo/todo_state.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'package:todo_task/utils/app_icons.dart';

const List<String> list = <String>['0xFFC6E6F6', '0xFFF6CFC6', '0xFFF6E3C6'];

class DropdownItem extends StatefulWidget {
  const DropdownItem({super.key});


  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) => BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return DropdownMenu<String>(
            // width: 75,
            menuStyle: MenuStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppColors.grey100;
                }
                return AppColors.grey100;
              }),
            ),
            trailingIcon: SvgPicture.asset(AppIcons.arrowDownBlue),
            initialSelection: list.first,
            onSelected: (String? value) {
              // state.copyWith(eventPriority: value!);
              setState(() {
                dropdownValue = value!;
              });
            },
            dropdownMenuEntries:
                list.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(value: value, label: value);
            }).toList(),
          );
        },
      );
}
