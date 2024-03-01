import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
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
                    color: Color(0xff5D9CEC),
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
                        "Text tittle",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text("Text description"),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff5D9CEC),
                    ),
                    height: 34,
                    width: 69,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                      weight: 15,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
