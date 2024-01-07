import 'package:hive_flutter/adapters.dart';

class TodoDatabase{
  List todoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData(){
    todoList = [
      ["Start doing",false],
      ["Do exercise",false]
    ];
  }

  void loadData(){
      todoList = _myBox.get("TODOLIST");
  }

  void updateDataBase(){
      _myBox.put("TODOLIST", todoList);
  }
}

