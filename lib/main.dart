import 'package:flutter/material.dart';
import 'package:my_todos/models/task_data.dart';
import 'package:my_todos/screens/Tasks_Screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //it takes the data we want to provide
      create: (context)=>TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:TasksScreen(),

      ),
    );
  }
}
