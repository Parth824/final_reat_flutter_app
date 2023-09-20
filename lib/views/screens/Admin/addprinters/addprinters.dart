import 'package:flutter/material.dart';
import 'package:rentapp22/views/screens/Admin/addprinters/addprinter_alert.dart';
import 'package:rentapp22/views/screens/Admin/addprinters/controllers/addprinter_controller.dart';
import 'package:rentapp22/views/screens/Admin/addprinters/updateprinter.dart';
import '../../../../globals.dart';
import '../../../../size_config.dart';
import '../expense/add_expense_alert.dart';
import 'package:get/get.dart';

class AddPrinterPage extends StatefulWidget {
  const AddPrinterPage({super.key});

  static String routeName = '/additems';

  @override
  State<AddPrinterPage> createState() => _AddPrinterPageState();
}

class _AddPrinterPageState extends State<AddPrinterPage> {
  AddItemController addItemController = Get.put(AddItemController());

  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    await addItemController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: addItemController.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return Obx(() =>(addItemController.addItemlist.isNotEmpty)?ListView.builder(
                  itemCount: addItemController.addItemlist.value.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(addItemController.addItemlist.value[index]
                            ['Pro_Name']),
                        subtitle: Text(addItemController
                            .addItemlist.value[index]['Pro_Description']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return UpdatePage(
                                      id: addItemController.addItemlist[index]
                                          ['Pro_Id'],
                                      name: addItemController.addItemlist[index]
                                          ['Pro_Name'],
                                      type: addItemController.addItemlist[index]
                                          ['Pro_Type'],
                                      disp: addItemController.addItemlist[index]
                                          ['Pro_Description'],
                                      pric: addItemController.addItemlist[index]
                                          ['Pro_Price'],
                                      uni: addItemController.addItemlist[index]
                                          ['Pro_Unit'],
                                      gs: addItemController.addItemlist[index]
                                          ['GST'],
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.edit),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.05,
                            ),
                            InkWell(
                              onTap: () async {
                                await addItemController.DeleteData(data: {
                                  'Pro_Id':
                                      '${addItemController.addItemlist.value[index]['Pro_Id']}'
                                });
                                setState(() {});
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ):Center(child: Image.asset("assets/images/no-data.png"),));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertItems();
            },
          );
        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
