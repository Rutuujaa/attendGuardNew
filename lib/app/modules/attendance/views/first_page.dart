import 'package:example_getx/app/modules/attendance/views/get_roomno_model.dart';
import 'package:example_getx/app/modules/input_roll_no/get_photo_sign_resp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import '../providers/api_providers.dart';
import '../controllers/attendance_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Table(),
      ),
    );
  }
}

// class MyController extends GetxController {
//   var isEditMode = false.obs;

//   void toggleEditMode() {
//     isEditMode.value = !isEditMode.value;
//   }
// }
//GetView<AttendanceController>
class Table extends GetView<AttendanceController> {
  Table({super.key});

  final AttendanceController controller = Get.put(AttendanceController());
  List<TextEditingController> _textEditingController =
      List.generate(10, (i) => TextEditingController());

  List<TextEditingController> _textEditingController1 =
      List.generate(10, (i) => TextEditingController());

  List<TextEditingController> resultController =
      List.generate(10, (i) => TextEditingController());

  List<RxString> _textFieldValue = List.generate(10, (i) => ''.obs);

  List<RxString> _textFieldValue1 = List.generate(10, (i) => ''.obs);

  void resetPresentAbsentValues(String newValue, int index) {
    _textFieldValue[index].value = newValue;
    _textFieldValue1[index].value = newValue;

    _textEditingController[index].text = newValue;
    _textEditingController1[index].text = newValue;
    resultController[index].text = newValue;
  }

  void calculateResult(index) {
    final firstNumber = int.tryParse(_textEditingController[index].text) ?? 0;
    final secondNumber = int.tryParse(_textEditingController1[index].text) ?? 0;
    final result = firstNumber + secondNumber;
    resultController[index].text = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    controller.getAttendance('2');
    print("get Attendance call");
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 244, 244),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: const [
            // BoxShadow(
            //     color: Color.fromARGB(255, 213, 129, 10),
            //     blurRadius: 3,
            //     spreadRadius: 5,
            //     offset: Offset(0, 0)),
          ]),
      margin: EdgeInsets.only(left: 7),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Card(
              child: Stack(children: [
                DataTable(
                  columnSpacing: 6,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'Save',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'RoomNo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 57, 50, 55),
                              fontSize: 15),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Present',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 57, 50, 55),
                              fontSize: 15),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Absent',
                        //  textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 57, 50, 55),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Total',
                        style: TextStyle(
                          color: Color.fromARGB(255, 57, 50, 55),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Center(
                          child: IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.save),
                            onPressed: () {
                              controller.toggleEditMode();
                            },
                          ),
                        )),
                        DataCell(Obx(
                          () => Center(
                            child: Center(
                              child: Text(
                                ('${controller.roomNo.value}'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                            //onTap: () => apiProvider.fetchData(),
                            ),
                        DataCell(
                          Obx(
                            () => TextFormField(
                              controller: _textEditingController[index],
                              onChanged: (newValue) {
                                print(newValue);
                                _textFieldValue[index].value = newValue;
                                KeyboardKey:
                                TextInputType.number;
                                calculateResult(index);
                              },
                              readOnly: !controller.isEditMode.value,
                              decoration: InputDecoration(
                                hintText: '${controller.absent.value}',
                              ),
                              // initialValue:
                              //     attendance[index]['present'].toString(),
                              // initialValue: '0',
                            ),
                          ),
                        ),
                        DataCell(
                          Obx(
                            () => TextFormField(
                              controller: _textEditingController1[index],
                              onChanged: (newValue) {
                                _textFieldValue1[index].value = newValue;
                                KeyboardKey:
                                TextInputType.number;
                                calculateResult(index);
                              },

                              readOnly: !controller.isEditMode.value,
                              decoration: InputDecoration(
                                hintText: '${controller.present.value}',
                              ),
                              // initialValue:
                              //     attendance[index]['absent'].toString(),
                              // initialValue: '0',
                              // readOnly: editclicked ? false : true,
                            ),
                          ),
                        ),
                        DataCell(
                          TextFormField(
                            controller: resultController[index],
                            textAlign: TextAlign.center,
                            readOnly: true,
                            // initialValue: attendance[index]['total'].toString(),
                            // initialValue: '0',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 7,
                  right: 8,
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        // Reset button logic here...
                        for (int i = 0; i < 10; i++) {
                          resetPresentAbsentValues('', i);
                        }
                      },
                      child: Transform.translate(
                        offset: Offset(-18, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.refresh),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
