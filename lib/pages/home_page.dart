
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';

import '../utiles/dialog_box.dart';
import '../utiles/to_do_list.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  //reference to the hive

  final my_box=Hive.box('mybox');

  ToDoDatabase db = ToDoDatabase();

 
  final controll=TextEditingController();

   void initState(){
    if (my_box.get("TODOLIST")==null) {
      db.create_init_data();
    }
    else{
      db.loadData();
    }
    super.initState();
  }
  void saveNewTask(){
    setState(() {
      db.todoList.add([controll.text,false]);
      controll.clear();
    });
    Navigator.of(context).pop();
    db.update();
  }

  void create_new_task() {
    showDialog(
      context: context,
      builder: (context) {
        return dialog_box(
          text_controll: controll,
          onCancel:()=> Navigator.of(context).pop(),
          onSaved: saveNewTask,
          
        );
      },
    );
    db.update();
  }

  void delete_task(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.update();
  }
  

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Text(
            "To Do App",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[200],
          onPressed: create_new_task,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return to_do_list(
              task_name: db.todoList[index][0],
              task_complete: db.todoList[index][1],
              onChanged: (p0) {
                setState(() {
                  db.todoList[index][1] = !db.todoList[index][1];
                  db.update();
                });
              },
              deleteAction: (context) => delete_task(index),
            );
          },
        ));
  }
}
