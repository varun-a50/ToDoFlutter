import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class Todo extends StatelessWidget {
  final String notetext;
  final bool changeCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  Todo({
    super.key,
    required this.notetext,
    required this.changeCompleted,
    required this.onChanged,
    required this.deleteTask,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0,top: 24.0,right: 24.0,bottom: 0.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask,icon: Icons.delete,backgroundColor: Colors.red.shade300,borderRadius: BorderRadius.circular(12),)
          ],
        ),
        child: Container(
          padding:  const EdgeInsets.all(24.0),
          decoration: BoxDecoration(color: Colors.yellow,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Checkbox(value: changeCompleted, onChanged: onChanged,activeColor: Colors.black,),
              Text(notetext,
              style: TextStyle(decoration: changeCompleted ? TextDecoration.lineThrough: TextDecoration.none),),
        
            ],
          ),
        
        ),
      ),
    );
  }
}
