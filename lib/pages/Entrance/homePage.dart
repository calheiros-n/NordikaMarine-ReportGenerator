import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nreport/pages/AboutService/serviceDescription.dart';

class ReportController extends GetxController {
  
  TextEditingController controller = TextEditingController();
   Rx<DateTime> selectedInitialDate = DateTime.now().obs;
   Rx<DateTime> selectedFinalDate = DateTime.now().obs;
   Rx<TimeOfDay> selectedStartTime = TimeOfDay.now().obs;
   Rx<TimeOfDay> selectedEndTime = TimeOfDay.now().obs;
   Rx<TextEditingController> nameController = TextEditingController().obs;

  void setInitialDate(DateTime date) => selectedInitialDate.value = date;
  void setFinalDate(DateTime date) => selectedFinalDate.value = date;
  void setStartTime(TimeOfDay time) => selectedStartTime.value = time;
  void setEndTime(TimeOfDay time) => selectedEndTime.value = time;
  
}

class ReportCreate extends StatefulWidget {
  
  @override
  State<ReportCreate> createState() => _ReportCreateState();
}

class _ReportCreateState extends State<ReportCreate> {
  
  final ReportController reportController = Get.put(ReportController());
  

  @override
  Widget build(BuildContext context) {

    @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reports',
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You have no report yet',
                            style: TextStyle(
                              color: Color.fromARGB(255, 86, 84, 84),
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        key: ValueKey('ShowPopUp'),
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height * 1.0,
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        'For which period is this new report?',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Baloo2',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Name of technician',
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(255, 86, 84, 84),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                           _showNameInputDialog();
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 40, 60, 117),
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              Text('    Write your name'),
                                              Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Obx(() => Text(
  reportController.nameController.value.text,
)),

),

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Day',
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(255, 86, 84, 84),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            DateTime? pickedDate = await showDatePicker(
                                              context: context,
                                              initialDate: reportController.selectedInitialDate.value,
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101),
                                            );
                                            if (pickedDate != null) {
                                              reportController.setInitialDate(pickedDate);
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 40, 60, 117),
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              Text('    Select the initial date'),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                child: Obx(() => Text(
                                                  '${reportController.selectedInitialDate.value.day}/${reportController.selectedInitialDate.value.month}/${reportController.selectedInitialDate.value.year}',
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 0.5,
                                      color: Colors.grey,
                                    ),
                                    // segunda linha
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            DateTime? pickedDate = await showDatePicker(
                                              context: context,
                                              initialDate: reportController.selectedFinalDate.value,
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2101),
                                            );
                                            if (pickedDate != null) {
                                              reportController.setFinalDate(pickedDate);
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 40, 60, 117),
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              Text('    Select the final date'),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                child: Obx(() => Text(
                                                  '${reportController.selectedFinalDate.value.day}/${reportController.selectedFinalDate.value.month}/${reportController.selectedFinalDate.value.year}',
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //terceira linha
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'How many time?',
                                            style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(255, 86, 84, 84),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Container para seleção de hora inicial
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            TimeOfDay? pickedTime = await showTimePicker(
                                              context: context,
                                              initialTime: reportController.selectedStartTime.value,
                                            );
                                            if (pickedTime != null) {
                                              reportController.setStartTime(pickedTime);
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 40, 60, 117),
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              Text('    Select the initial hour  '),
                                              Obx(() => Text(
                                                '${reportController.selectedStartTime.value.hour}:${reportController.selectedStartTime.value.minute}',
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 0.5,
                                      color: Colors.grey,
                                    ),
                                    // quarta linha
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: GestureDetector(
                                          onTap: () async {
                                            TimeOfDay? pickedTime = await showTimePicker(
                                              context: context,
                                              initialTime: reportController.selectedEndTime.value,
                                            );
                                            if (pickedTime != null) {
                                              reportController.setEndTime(pickedTime);
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(255, 40, 60, 117),
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              Text('    Select the final hour  '),
                                              Obx(() => Text(
                                                '${reportController.selectedEndTime.value.hour}:${reportController.selectedEndTime.value.minute}',
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 100),
                                      child: GestureDetector(
                                        key: ValueKey('GoToHomePage'),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ServiceDescription(
                                                initialdate: '${reportController.selectedInitialDate.value.day}/${reportController.selectedInitialDate.value.month}/${reportController.selectedInitialDate.value.year}',
                                                finaldate: '${reportController.selectedFinalDate.value.day}/${reportController.selectedFinalDate.value.month}/${reportController.selectedFinalDate.value.year}',
                                                inicialHour: '${reportController.selectedStartTime.value.hour}:${reportController.selectedStartTime.value.minute}',
                                                finalHour: '${reportController.selectedEndTime.value.hour}:${reportController.selectedEndTime.value.minute}',
                                                 TechnicianName: '${reportController.nameController.value.text}',
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: Color.fromARGB(255, 40, 60, 117),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Next',
                                              style: TextStyle(
                                                fontFamily: 'Baloo2',
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    // final
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 40, 60, 117),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            child: Text(
                              'Create one!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


   // Método para exibir o diálogo de entrada do nome
  Future<void> _showNameInputDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Write your name',
        style: TextStyle(
                                              fontFamily: 'Baloo2',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(255, 86, 84, 84),
                                            ),
        ),
        content: Obx(
          () => TextField(
            controller: reportController.nameController.value,
            decoration: InputDecoration(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: Color.fromARGB(255, 40, 60, 117),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Ok',
                                              style: TextStyle(
                                                fontFamily: 'Baloo2',
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}
