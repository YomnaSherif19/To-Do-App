 import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_todos/models/task_data.dart';
import 'package:my_todos/screens/Add_Task_popup.dart';
import 'package:my_todos/widgets/Tasks_List.dart';

import '../models/task.dart';
import 'package:provider/provider.dart';


class TasksScreen extends StatelessWidget {

  // List<Task> tasks=[
  //   Task(name: "Studying"),
  //   Task(name: "Praying"),
  // ];
// list of type Task obj
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app background
      backgroundColor: HexColor("7BA4E0"),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        //onPressed takes anonymous function
        onPressed: (){
          //show popup screen
          showModalBottomSheet(
            isScrollControlled: true,//to make it scrollable w yeban lama el keyboard yezhar mesh yedari 3aleih
            // instead of creating container here we will make it in another file
            // context: context, builder: (context)=>Container(

            //to make it scrollable w yeban lama el keyboard yezhar mesh yedari 3aleih on any device
            context: context, builder: (context)=> SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskPopup((newTaskTitle){
                  // setState(() {
                  //   // add the new task to tasks list
                  //   tasks.add(Task(name: newTaskTitle));
                  //   //to make keyboard disappear after adding task
                  //   Navigator.pop(context);
                  // });
                }),
          ),
            ),
          );
        },
        backgroundColor: Colors.white,
        icon: Icon(
          Icons.add,
          color: HexColor("4072BC"),
        ),
        label: Text(
            "Create",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: HexColor("4072BC"),
          ),
        ),
      ),

      //no appbar
      // appBar: AppBar(
      // ),

      //body
      //we added a container for the spacing only ,we could 've put column only
      body:Container(
        padding:const EdgeInsets.only(top: 60,left:20,right: 20,bottom: 60),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/sketch_background.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title and icon
              Row(
                children:const [
                  Icon(
                      Icons.playlist_add_check_circle_rounded,
                    size:35 ,
                    color: Colors.white,
                  ),
                  //add spacing between text and icon using sizedbox
                  SizedBox(width: 20,),
                  Text(
                      "My ToDos",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35 ,
                    ),
                  )
                ],
              ),

              SizedBox(width: 40,height: 20,),

              //nb of tasks u wrote
              Text(
                  "${Provider.of<TaskData>(context).tasks.length}tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:20,
                ),
              ),

              //add spacing between it and what's next
              SizedBox(height: 20,),

              //to make the card including tasks
              Expanded(
                child: Container(
                  // height: 600,
                  decoration: BoxDecoration(
                    color: HexColor("4072BC"),
                    borderRadius: BorderRadius.all(Radius.circular(66)),
                  ),

                  //list of tasks
                  child: TasksList(),
                  // ListView(
                  //   children: [
                  //     //each element of the list has checkbox and task name
                  //     ListTile(
                  //       title:Text("studying"),
                  //       trailing: Checkbox(
                  //         value: false,
                  //         onChanged:null ,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}

