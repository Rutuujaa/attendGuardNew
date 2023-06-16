import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondTab extends StatelessWidget {
  final AttendanceController controller = AttendanceController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 245, 244, 244),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 229, 228, 228),
            blurRadius: 10,
            spreadRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Center No: 2',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(247, 15, 14, 14),
                ),
              ),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 46, 45, 45),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Center Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(247, 15, 14, 14),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Lalbahadur Shastri High School',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromARGB(247, 15, 14, 14),
                ),
              ),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 46, 45, 45),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Center Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(247, 15, 14, 14),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Near Dr.B.Ambedkar Cantonment General Hospital Khadki, Pune-411003',
                style: TextStyle(
                  fontSize: 16,
                  //  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(247, 15, 14, 14),
                ),
              ),
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 46, 45, 45),
          ),

          // Rest of the code...
          SizedBox(
            height: 200,
            // width: 40, // Adjust the height as needed
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 2,
                ),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(label: Text('Rooms')),
                    DataColumn(label: Text('Present')),
                    DataColumn(label: Text('Absent')),
                    DataColumn(label: Text('Total')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          TextField(
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        DataCell(
                          TextField(
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        DataCell(
                          TextField(
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        DataCell(
                          TextField(
                            keyboardType: TextInputType.number,
                          ),
                          // Show the total value
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceController {
  int present = 0;
  int absent = 0;

  void setPresent(int value) {
    present = value;
  }

  void setAbsent(int value) {
    absent = value;
  }

  int calculateTotal() {
    return present + absent;
  }
}
