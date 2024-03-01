import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/tabs/settingTab.dart';
import 'package:to_do_app/tabs/taskTab.dart';

import 'deatiled_tabs/addTaskBottomSheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = 'homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("To Do List",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff5D9CEC),
      ),
      backgroundColor: Color(0xffDFECDB),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Color(0xff5D9CEC),
          unselectedItemColor: Color(0xffC8C9CB),
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.task,
                  size: 25,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 25), label: ''),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff5D9CEC),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.white, width: 3)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.only(bottom:
                  MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskBouttomSheet());
              });
        },
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    TaskTab(),
    SettingTab(),
  ];
}
