import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentapp22/globals.dart';

import '../../../../../size_config.dart';
import '../controllers/doctor_controller.dart';

class PendingTransactionDoctor extends StatefulWidget {
  const PendingTransactionDoctor({super.key});

  @override
  State<PendingTransactionDoctor> createState() =>
      _PendingTransactionDoctorState();
}

class _PendingTransactionDoctorState extends State<PendingTransactionDoctor> {
  DoctorController doctorController = Get.find<DoctorController>();

  getdata(var amount) {
    doctorController.total.value =
        doctorController.total.value + int.parse(amount);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.0233,
          bottom: MediaQuery.of(context).size.width * 0.0233,
          left: MediaQuery.of(context).size.width * 0.00456,
          right: MediaQuery.of(context).size.width * 0.00456),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.05,
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                        "Date",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Invoice No.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: doctorController
                  .getPanding(k: {"Id": "${doctorController.id.value}"}),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "${snapshot.error}",
                      style: TextStyle(),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Obx(
                    () => (doctorController.doctorPanding.value.isEmpty)
                        ? Center(
                            child: Image.asset("assets/images/no-data.png"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: doctorController.doctorPanding.length,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                height: SizeConfig.screenHeight * 0.04,
                                width: SizeConfig.screenWidth,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        doctorController.doctorPanding[index]
                                            ["O_Date"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.037,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        doctorController.doctorPanding[index]
                                            ["O_Id"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.037,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        doctorController.doctorPanding[index]
                                            ["Amount"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.037,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Expanded(
                                      
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(
                                                    "Are You Sure This Payment is Recived"),
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
                                                          await doctorController
                                                              .pymentReciveing(
                                                                  k: {
                                                            'O_Id':
                                                                "${doctorController.doctorPanding[index]['O_Id']}",
                                                          });
                                                      if (data['result'] ==
                                                          "Updatetion successfuly") {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "SuccessFluuy.."),
                                                          backgroundColor:
                                                              Colors.green,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                        ));
                                                        await doctorController
                                                            .getData();
                                                      } else {
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content:
                                                              Text("Falid.."),
                                                          backgroundColor:
                                                              Colors.red,
                                                          behavior:
                                                              SnackBarBehavior
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
                                        child: Icon(Icons.edit),
                                      ),
                                    )
                                  ],
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
            Container(
              height: SizeConfig.screenHeight * 0.05,
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.0256),
              color: Colors.grey.shade300,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 6,
                        child: Text(
                          "Closing Amount:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037,
                              fontWeight: FontWeight.w600),
                        )),
                    Expanded(
                      flex: 2,
                      child: Obx(() {
                        doctorController.total.value = 0;
                        for (int i = 0;
                            i < doctorController.doctorPanding.length;
                            i++) {
                          getdata(doctorController.doctorPanding[i]['Amount']);
                        }
                        return Text(
                          doctorController.total.value.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037,
                              fontWeight: FontWeight.bold),
                        );
                      }),
                    ),
                  ]),
            )
          ]),
    );
  }
}
