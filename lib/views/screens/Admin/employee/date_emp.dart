import 'package:flutter/material.dart';
import 'package:rentapp22/views/screens/Admin/employee/controllers/employee_controller.dart';
import 'package:rentapp22/views/screens/Admin/employee/info_employee.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';

class DateList extends StatefulWidget {
  const DateList({Key? key}) : super(key: key);

  @override
  State<DateList> createState() => _DateListState();
}

class _DateListState extends State<DateList> {
  EmployeeController employeeController = Get.put(EmployeeController());
  TextEditingController pa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String k = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: employeeController.getApiData(k: {"Id": k}),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return Obx(
              () => (employeeController.addalldata.value.isEmpty)
                  ? Center(
                      child: Image.asset("assets/images/no-data.png"),
                    )
                  : ListView.builder(
                      itemCount: employeeController.addalldata.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: (employeeController.addalldata[index]
                                          ['P_A'] ==
                                      "P")
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${employeeController.addalldata[index]['Emp_Date']}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${employeeController.addalldata[index]['P_A']}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          pa.text = employeeController.addalldata[index]
                                              ['P_A'];
                                          return AlertDialog(
                                            content: TextFormField(
                                              controller: pa,
                                              decoration: InputDecoration(
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(SizeConfig
                                                              .screenHeight *
                                                          0.03),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(SizeConfig
                                                              .screenHeight *
                                                          0.03),
                                                ),
                                                hintText: "P And A",
                                                hintStyle: TextStyle(),
                                                labelText: "Attendanc",
                                                labelStyle: TextStyle(),
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  var data =
                                                      await employeeController
                                                          .upadetApiData(k: {
                                                    'A_Id':
                                                        "${employeeController.addalldata[index]['A_Id']}",
                                                    'P_A': (pa.text =="A"||pa.text =='a')?"A":"P"
                                                  });
                                                  if (data['result'] ==
                                                      "Updatetion successfuly") {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "SuccessFluuy.."),
                                                      backgroundColor:
                                                          Colors.green,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                    ));
                                                    await employeeController
                                                        .getData();
                                                  } else {
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text("Falid.."),
                                                      backgroundColor:
                                                          Colors.red,
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                    ));
                                                  }
                                                },
                                                child: Text("Ok"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
