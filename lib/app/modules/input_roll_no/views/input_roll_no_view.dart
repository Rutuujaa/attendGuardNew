import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/input_roll_no_controller.dart';

class InputRollNoView extends GetView<InputRollNoController> {
  final String rollNo;

  const InputRollNoView({
    Key? key,
    required this.rollNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(InputRollNoController());
    controller.rollNumberController.text =
        rollNo; // Set the roll number in the text field

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Roll Number'),
        backgroundColor: Color.fromARGB(255, 240, 110, 34),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.rollNoFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const Text(
                    'Roll Number',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.rollNumberController,
                    onSaved: (value) {
                      print('onSave called for roll number');
                      controller.rollNumber = value!;
                    },
                    validator: (value) {
                      return controller.validateRollNo(value!);
                    },
                    style: const TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: 'Roll No',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(double.infinity, 60),
                        ),
                        // Customizing the button decoration
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 240, 110, 34),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                        overlayColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 247, 118, 33),
                        ),
                      ),
                      child: const Text(
                        'Get Photo and Sign',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      onPressed: () async {
                        var result = await controller.fetchPhotoSign();
                        if (result == 0) {
                          controller.verifyRollNumber(
                            controller.rollNumberController.text,
                          );
                        } else {
                          // Show error popup
                          Get.dialog(
                            AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Invalid roll number'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _displayPhoto(controller),
                  const SizedBox(height: 20),
                  _displaySign(controller),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _displayPhoto(controller) {
  var defaultImage = 'images/avatar.png';
  return Obx(() {
    return controller.photo.value == null
        ? SizedBox(
            width: 300,
            child: Image.asset(defaultImage),
          )
        : SizedBox(
            width: 300,
            child: Image.network('${controller.photo.value}'),
          );
  });
}

Widget _displaySign(controller) {
  var defaultImage = 'images/avatar_sign.png';
  return Obx(() {
    return controller.sign.value == null
        ? SizedBox(
            width: 200,
            child: Image.asset(defaultImage),
          )
        : SizedBox(
            width: 200,
            child: Image.network('${controller.sign.value}'),
          );
  });
}
