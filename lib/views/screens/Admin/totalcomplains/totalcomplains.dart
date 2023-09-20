import 'package:flutter/material.dart';
import 'package:rentapp22/views/screens/Admin/totalcomplains/controllers/total_complain_controller.dart';

import '../../../../size_config.dart';
import 'package:get/get.dart';

import 'listofempcomplains.dart';

class TotalComplainsPage extends StatefulWidget {
  const TotalComplainsPage({super.key});

  static String routeName = '/totalcomplains';

  @override
  State<TotalComplainsPage> createState() => _TotalComplainsPageState();
}

class _TotalComplainsPageState extends State<TotalComplainsPage> {
  ComplainController complainController = Get.put(ComplainController());

  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    await complainController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Obx(() {
        return (complainController.complainlist.value.isNotEmpty)
            ? ListView.builder(
                itemCount: complainController.complainlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 9.0, right: 9, bottom: 9, top: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: SizeConfig.screenHeight * .15,
                                  width: SizeConfig.screenWidth * .30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11),
                                    child: Image.network(
                                      "https://udservice.shop/Upload/${complainController.complainlist[index]['Image']}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(9),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: SizeConfig.screenHeight * 0.035,
                                      child: Row(
                                        children: [
                                          Text(
                                            complainController
                                                    .complainlist[index]
                                                ['Printer_Name'],
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        15),
                                                letterSpacing: 1,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: (complainController
                                                                        .complainlist[
                                                                    index][
                                                                'Nozel_Check'] ==
                                                            null)
                                                        ? Image.asset(
                                                            "assets/images/no-data.png")
                                                        : Image.network(
                                                            "https://udservice.shop/Upload/${complainController.complainlist[index]['Nozel_Check']}"),
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        complainController.complainlist[index]
                                            ['Description'],
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    14),
                                            letterSpacing: 1,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(10),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () async {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text("Worring"),
                                                  content: Text(
                                                      "You Sure To Delte This Complains Request..."),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Cancel",
                                                      ),
                                                    ),
                                                    OutlinedButton(
                                                      onPressed: () async {
                                                        var data =
                                                            await complainController
                                                                .DeleteCompla(
                                                                    k: {
                                                              'C_Id': complainController
                                                                      .complainlist[
                                                                  index]['C_Id'],
                                                            });
                                                        if (data['result'] ==
                                                            "Delete successfuly") {
                                                          Navigator.pop(
                                                              context);
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
                                                        } else {
                                                          Navigator.pop(
                                                              context);
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  "Fali.."),
                                                              backgroundColor:
                                                                  Colors.red,
                                                              behavior:
                                                                  SnackBarBehavior
                                                                      .floating,
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      child: Text(
                                                        "Ok",
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            await complainController.getData();
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EmpListComplains(),
                                                settings: RouteSettings(
                                                  arguments: complainController
                                                          .complainlist[index]
                                                      ['C_Id'],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text("Confirm"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: Image.asset("assets/images/no-data.png"),
              );
      }),
    );
  }
}
