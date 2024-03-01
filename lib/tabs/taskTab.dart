import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

import 'deatiled_tabs/taskItem.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          height: 90,
          initialSelectedDate: DateTime.now(),
          selectionColor: Color(0xff5D9CEC),
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // New date selected
            // setState(() {
            //   _selectedValue = date;
            // });
          },
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context,index){
                return TaskItem();
              },
              separatorBuilder: (context,index)=>SizedBox(height: 5),
              itemCount: 10),
        )
      ],
    );
  }
}
