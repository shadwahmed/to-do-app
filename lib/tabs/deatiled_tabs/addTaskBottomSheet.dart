import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskBouttomSheet extends StatefulWidget {
   AddTaskBouttomSheet({super.key});

  @override
  State<AddTaskBouttomSheet> createState() => _AddTaskBouttomSheetState();
}

class _AddTaskBouttomSheetState extends State<AddTaskBouttomSheet> {
  DateTime chosenDate =DateTime.now();
  var tittleController =TextEditingController();
  var descriptionController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Task",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextFormField(
              controller: tittleController,
              decoration: InputDecoration(
                label: Text("Tittle"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xff5D9CEC))),
                focusColor: Color(0xff5D9CEC),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                label: Text("Description"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xff5D9CEC))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Time",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  selectDate(context);
                },
                child: Text(
                  "${chosenDate.toString().substring(0,10)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5D9CEC),
                ),
                onPressed: () {},
                child: Text(
                  "Add Task",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async{
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: chosenDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 360)));
    if(selectedDate!=null){
      chosenDate=selectedDate;
      setState(() {

      });
    }
  }
}