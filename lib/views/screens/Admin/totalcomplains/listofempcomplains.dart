import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/total_complain_controller.dart';


class EmpListComplains extends StatefulWidget {
  const EmpListComplains({super.key});

  @override
  State<EmpListComplains> createState() => _EmpListComplainsState();
}

class _EmpListComplainsState extends State<EmpListComplains> {
  ComplainController orderRequestController =
      Get.put(ComplainController());
  @override
  Widget build(BuildContext context) {
    String k = ModalRoute.of(context)!.settings.arguments as String;
    print(k);
    return Scaffold(
      appBar: AppBar(
        title: Text("EMP"),
      ),
      body: FutureBuilder(
        future: orderRequestController.getEmpData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return Obx(
              () => (orderRequestController.listEmpComplain.isNotEmpty)
                  ? ListView.builder(
                      itemCount:
                          orderRequestController.listEmpComplain.value.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            isThreeLine: true,
                            title: Text(
                                "${orderRequestController.listEmpComplain.value[index]['First_Name']} ${orderRequestController.listEmpComplain.value[index]['Last_Name']}"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(orderRequestController
                                    .listEmpComplain.value[index]['Email']),
                                Text(orderRequestController.listEmpComplain
                                    .value[index]['Phone_Number']),
                              ],
                            ),
                            trailing: ElevatedButton(
                              onPressed: () async {
                                var data = await orderRequestController
                                    .choiseEmp(k: {
                                  'C_Id': k,
                                  'E_Id': orderRequestController
                                      .listEmpComplain[index]['E_Id']
                                });
                                if (data['result'] ==
                                    "Updatetion successfuly") {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("SuccessFluuy.."),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Fali.."),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              child: Text("Confirm"),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Image.asset("assets/images/no-data.png"),
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