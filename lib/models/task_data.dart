import 'package:flutter/material.dart';
import 'package:my_todos/models/task.dart';

//to be able to listen to the provider passed data
class TaskData extends ChangeNotifier{
  //we add the thing we want to provide to the parts we want
  List<Task> tasks=[
    Task(name: "Studying"),
    Task(name: "Praying"),
  ];

  //another data we want to pass
void addTask(String newTaskTitle){
  tasks.add(Task(name: newTaskTitle));
  notifyListeners();//to notify all about the change we made here not above because there were no changes in the list
}

//to mark task as checked and pass it to the list from the tile
void updateTask(Task task){
  //task is done /checked
  task.doneChange();
  notifyListeners();
}
void deleteTask(Task task){
  //task is done /checked
  tasks.remove(task);
  notifyListeners();
}

}