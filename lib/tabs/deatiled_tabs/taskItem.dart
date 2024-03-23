import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/firebase/firebase_function.dart';
import 'package:to_do_app/tabs/taskModel.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
   TaskItem({required this.taskModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(taskModel.id??'');
              },
              backgroundColor: Colors.red,
              autoClose: true,
              icon: Icons.delete,
              label: "Delete",
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.blue,
              autoClose: true,
              icon: Icons.delete,
              label: "Edit",
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(20),
          height: 100,
          child: Slidable(
            child: Row(
              children: [
                Container(
                  height: 162,
                  width: 5,
                  decoration: BoxDecoration(
                    color: taskModel.isDone! ?Colors.green:Color(0xff5D9CEC),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(taskModel.description??''),
                    ],
                  ),
                ),
                InkWell(
                  onTap:(){
                    taskModel.isDone=true;
                    FirebaseFunctions.updateTask(taskModel);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: taskModel.isDone! ?Colors.green:Color(0xff5D9CEC),
                      ),
                      height: 34,
                      width: 69,
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 30,
                        weight: 15,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
