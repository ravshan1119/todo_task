import 'package:flutter/material.dart';
import 'package:todo_task/ui/details/widgets/app_bar_custom.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBarCustom(
          title: "Watching Football ",
          subtitle: "Manchester United vs Arsenal (Premiere League)",
          image: "",
          onTap: () {},
          body: const Text("Nimadur"),),
    );
  }
}
