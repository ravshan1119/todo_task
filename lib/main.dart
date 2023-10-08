import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/bloc/todo/todos_event.dart';
import 'package:todo_task/ui/app_routes.dart';
import 'package:todo_task/utils/app_colors.dart';
import 'bloc/todo/todos_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) => TodosBloc()..add(GetTodo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
              .copyWith(background: AppColors.white),
        ),
        darkTheme: ThemeData.light(),
        initialRoute: RouteNames.calendar,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
