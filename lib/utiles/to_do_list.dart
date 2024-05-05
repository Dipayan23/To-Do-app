import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class to_do_list extends StatelessWidget {
  bool task_complete;
  String task_name;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteAction;

  to_do_list({
    super.key,
    required this.task_name,
    required this.task_complete,
    required this.onChanged,
    required this.deleteAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              onPressed: deleteAction,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink[200],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                task_name,
                style: TextStyle(
                  fontSize: 18,
                  decoration: task_complete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Checkbox(
                value: task_complete,
                onChanged: onChanged,
                activeColor: Colors.pink,
              )
            ],
          ),
        ),
      ),
    );
  }
}
