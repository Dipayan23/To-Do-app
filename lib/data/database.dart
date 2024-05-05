import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList=[];
  // ignore: unused_field
  final _myBox = Hive.box('mybox');

  void create_init_data(){
    todoList=[
      ["Eating",false],
      ["sleeping",true],
    ];
  }

  void loadData(){
    todoList = _myBox.get("TODOLIST");
  }
  void update(){
    _myBox.put("TODOLIST", todoList);
  }
}