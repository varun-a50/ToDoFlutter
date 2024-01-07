import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoflutterapp/data/database.dart';
import 'package:todoflutterapp/utilities/dialog_box.dart';
import 'package:todoflutterapp/utilities/todo_title.dart';
import 'package:flutter/src/widgets/navigator.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  //reference box from main
  final _myBox = Hive.box('mybox');
  final _controller = TextEditingController();


  TodoDatabase db = TodoDatabase();

  @override
  void initState(){
    //if this is the first time opening a app then show default data
    if(_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();


  }


  void onitemChecked(bool? value,int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }
  void saveTasks(){
    setState(() {
      db.todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  void CreateDialogBox(){
    showDialog(context: context, builder: (context) {
      return DialogBox(controller: _controller, onSave: saveTasks, onCancel: () => Navigator.of(context).pop());
    });

  }
  void DeleteTask(index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: CreateDialogBox,
      child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Todo(
              notetext: db.todoList[index][0],
              changeCompleted: db.todoList[index][1],
              onChanged: (value) =>{onitemChecked(value,index),},
              deleteTask: (context) => DeleteTask(index),);
        },

      ),

    );
  }

}
