import 'package:example_getx/app/modules/attendance/views/first_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/attendance_controller.dart';
import 'second_page.dart';

class AttendanceView extends GetView<GetxController> {
  AttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Please input Attendance of Center'),
            backgroundColor: Color.fromARGB(255, 238, 127, 63),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(top: 17, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    // begin: Alignment.topLeft,
                    // end: Alignment.bottomRight
                  ),
                  color: Color.fromARGB(255, 11, 10, 9),
                  //borderRadius: BorderRadius.circular(25.0),
                ),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: Color.fromARGB(255, 238, 127, 63),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: "RoomWise",
                      ),
                      Tab(
                        text: "Center",
                      )
                    ]),
              ),
              Expanded(
                child: TabBarView(
                  children: [FirstPage(), SecondTab()],
                ),
              ),
            ]),
          )),
    );
  }
}
