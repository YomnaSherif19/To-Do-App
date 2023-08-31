import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class TasksListTile extends StatelessWidget{

  // const TasksListTile({
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?)checkboxChange;
  final void Function ()listTileDelete;


  TasksListTile( {
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxChange,
  required this.listTileDelete,
  });

  @override
  Widget build(BuildContext context){
    //each element of the list has checkbox and task name
    return ListTile(
      title:Text(
         taskTitle,
      style: TextStyle(
        color: Colors.white,
        decoration: isChecked ? TextDecoration.lineThrough :null,
      ),
      ),
      trailing:Checkbox(
        activeColor: HexColor("7BA4E0"), //box color when checked
        checkColor: Colors.white, //check mark color
        value:isChecked,
        onChanged:checkboxChange,
      ),
      onLongPress:listTileDelete ,
    );
  }
}

//       (bool ? newValue){//checkbox isChanged when given a new value
//   setState(() {//to make changes appear
//     isChecked=newValue!;
//   });
// } ,




// class TaskCheckBox extends StatelessWidget {
//   final bool? checkboxState; //this will represent ischecked in the other class
//   final Function(bool?)checkboxChange; //this will represent setstate in the other class
//   TaskCheckBox(this.checkboxState, this.checkboxChange);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }