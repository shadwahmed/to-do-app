import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/firebase/firebase_function.dart';
import 'package:to_do_app/tabs/taskModel.dart';

import 'deatiled_tabs/taskItem.dart';

class TaskTab extends StatefulWidget {
  TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          height: 90,
          initialSelectedDate: selectedDate,
          selectionColor: Color(0xff5D9CEC),
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            selectedDate = date;
            setState(() {});
          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseFunctions.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                );
              }
              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (tasks.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskItem(
                      taskModel: tasks[index],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 5),
                  itemCount: tasks.length);
            },
          ),
        )
      ],
    );
  }
}
