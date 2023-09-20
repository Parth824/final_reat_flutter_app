import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Admin/orderRequest/controllers/oreder_request_controller.dart';
import '../../../../size_config.dart';
import 'orderRequest.dart';

class ListEmployye extends StatefulWidget {
  const ListEmployye({super.key});

  static String routeName = '/listEmprequest';

  @override
  State<ListEmployye> createState() => _ListEmployyeState();
}

class _ListEmployyeState extends State<ListEmployye> {
  OrderRequestController orderRequestController =
      Get.put(OrderRequestController());
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
              () => (orderRequestController.listEmpRequest.isNotEmpty)
                  ? ListView.builder(
                      itemCount:
                          orderRequestController.listEmpRequest.value.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            isThreeLine: true,
                            title: Text(
                                "${orderRequestController.listEmpRequest.value[index]['First_Name']} ${orderRequestController.listEmpRequest.value[index]['Last_Name']}"),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(orderRequestController
                                    .listEmpRequest.value[index]['Email']),
                                Text(orderRequestController.listEmpRequest
                                    .value[index]['Phone_Number']),
                              ],
                            ),
                            trailing: ElevatedButton(
                              onPressed: () async {
                                var data = await orderRequestController
                                    .choiseEmp(k: {
                                  'O_Id': k,
                                  'E_Id': orderRequestController
                                      .listEmpRequest[index]['E_Id']
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
