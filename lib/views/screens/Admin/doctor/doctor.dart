import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/doctor/controllers/doctor_controller.dart';
import 'package:rentapp22/views/screens/Admin/doctor/info_page.dart';

import '../../../../globals.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  static String routeName = '/doctor';

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  DoctorController doctorController = Get.put(DoctorController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    await doctorController.getData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(() {
        return (doctorController.doctorlist.value.isNotEmpty)
            ? Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.only(
                    left: SizeConfig.screenWidth * 0.0233,
                    right: SizeConfig.screenWidth * 0.0233,
                    top: SizeConfig.screenWidth * 0.00456,
                    bottom: SizeConfig.screenWidth * 0.00456),
                child: SingleChildScrollView(
                  child: Column(children: [
                    ...doctorController.doctorlist.map((e) => GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Infor_Page(),
                            //     settings: RouteSettings(arguments: e),
                            //   ),
                            // );

                            Get.to(Infor_Page(), arguments: e);
                          },
                          child: Container(
                            padding:
                                EdgeInsets.all(SizeConfig.screenWidth * 0.0233),
                            margin: EdgeInsets.only(
                                top: SizeConfig.screenWidth * 0.0233),
                            height: SizeConfig.screenHeight * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.screenWidth * 0.0233),
                              color: Colors.blue.shade100,
                            ),
                            width: SizeConfig.screenWidth,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height:
                                                  SizeConfig.screenWidth * 0.07,
                                              width:
                                                  SizeConfig.screenWidth * 0.07,
                                              child: Image.asset(
                                                  "assets/images/hospital.png"),
                                            ),
                                            Text(
                                              " ${e["Hospital_Name"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.042,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.screenWidth * 0.00456,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height:
                                                  SizeConfig.screenWidth * 0.07,
                                              width:
                                                  SizeConfig.screenWidth * 0.07,
                                              child: Image.asset(
                                                  "assets/images/doctor.png"),
                                            ),
                                            Text(
                                              " ${e["First_Name"]} ${e["Last_Name"]}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    SizeConfig.screenWidth *
                                                        0.037,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.screenWidth * 0.00456,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height:
                                                  SizeConfig.screenWidth * 0.07,
                                              width:
                                                  SizeConfig.screenWidth * 0.07,
                                              child: Image.asset(
                                                  "assets/images/mobile.png"),
                                            ),
                                            Text(
                                              " ${e["Phone_Number"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.037,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height:
                                                SizeConfig.screenWidth * 0.07,
                                            width:
                                                SizeConfig.screenWidth * 0.07,
                                            child: Image.asset(
                                                "assets/images/paper.png"),
                                          ),
                                          Text(
                                            " ${e["Paper_Size"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    SizeConfig.screenWidth *
                                                        0.037,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height:
                                                SizeConfig.screenWidth * 0.07,
                                            width:
                                                SizeConfig.screenWidth * 0.07,
                                            child: Image.asset(
                                                "assets/images/rupee.png"),
                                          ),
                                          Text(
                                            " ${e["Paper_Price"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    SizeConfig.screenWidth *
                                                        0.037,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ]),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
