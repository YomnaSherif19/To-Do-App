import 'package:flutter/material.dart';

import '../models/task.dart';
import 'Tasks_ListTile.dart';
import 'package:provider/provider.dart';
import 'package:my_todos/models/task_data.dart';



class TasksList extends StatelessWidget{
  // List<Task> tasks;
//
//  TasksList(this.tasks);
//
//   @override
//   State<TasksList> createState() => _TasksListState();
// }

// class _TasksListState extends State<TasksList> {
  // List<Task> tasks=[
  //   Task(name: "Studying"),
  //   Task(name: "Praying"),
  // ];// list of type Task obj
  @override
  Widget build(BuildContext context){
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            // itemCount: Provider.of<TaskData>(context).tasks.length,
            itemCount: taskData.tasks.length,
            //we give a builder a context
            itemBuilder: (context,index){
              return TasksListTile(
                // taskTitle: Provider.of<TaskData>(context).tasks[index].name,
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,//ischecked=isdone
                checkboxChange: ( newValue){//checkbox isChanged when given a new value
                  taskData.updateTask(taskData.tasks[index]);
                  // setState(() {//to make changes appear
                  // // isChecked=newValue!;
                  //   Provider.of<TaskData>(context).tasks[index].doneChange();
                  // });
                },
                listTileDelete: (){
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            }
        );
      },
    );
        
        
    //   ListView(
    //   children: [
    //     //each element of the list has checkbox and task name
    //     TasksListTile(
    //         taskTitle:tasks[0].name,
    //       isChecked: tasks[0].isDone,//ischecked=isdone
    //     ),
    //     TasksListTile(
    //       taskTitle:tasks[1].name,
    //       isChecked: tasks[1].isDone,//ischecked=isdone
    //     ),
    //   ],
    // );

  }
}