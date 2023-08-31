import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:my_todos/models/task_data.dart';

class AddTaskPopup  extends StatelessWidget {

 final Function addTaskCallback;
 AddTaskPopup(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(35),
      child: Column(
        //it stretches the button and all
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Text(
              "Add Task",
              textAlign:TextAlign.center ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: HexColor("4072BC"),
              ),
            ),
           TextField(
            //to make the keyboard appear when the popup opens without clicking in the field
            autofocus: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexColor("4072BC"),
            ),
            decoration: InputDecoration(
              hintText: "My Task",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w200,
              ),
            ),
             onChanged: (newText){
              newTaskTitle=newText;
             },//when adding input
          ),

          SizedBox(height:25 ,),

          TextButton(
              onPressed: (){
                // a function to take the added task
                // addTaskCallback(newTaskTitle);
                //we want to rebuild so add listen:false
                Provider.of<TaskData>(context,listen:false).addTask(newTaskTitle!);
                Navigator.pop(context);
              },
              child: const Text(
                  "Add",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            style: TextButton.styleFrom(
              backgroundColor: HexColor("4072BC"),
            ),
          ),
        ],
      ),
    );
  }
}
