class Task{
  final String name;
   bool isDone;
   Task({ required this.name,this.isDone=false});

   void doneChange(){
     //to tell that it changed its value from false to true vice-versa
     isDone=!isDone;
   }
}