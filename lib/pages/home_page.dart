
import 'package:flutter/material.dart';

import '../utiles/dialog_box.dart';
import '../utiles/to_do_list.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List todoList = [
    ["Eating", false],
    ["Sleeping", true],
  ];

  final controll=TextEditingController();

  void saveNewTask(){
    setState(() {
      todoList.add([controll.text,false]);
      controll.clear();
    });
    Navigator.of(context).pop();
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
  }

  void delete_task(int index){
    setState(() {
      todoList.removeAt(index);
    });
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
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return to_do_list(
              task_name: todoList[index][0],
              task_complete: todoList[index][1],
              onChanged: (p0) {
                setState(() {
                  todoList[index][1] = !todoList[index][1];
                });
              },
              deleteAction: (context) => delete_task(index),
            );
          },
        ));
  }
}
