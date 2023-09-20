import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Admin/dashboard/controllers/dashboard_controller.dart';

import '../../../../globals.dart';
import '../../../../size_config.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    await dashBoardController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return (dashBoardController.dashBoard.value.isNotEmpty)
            ? Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(10),
                    bottom: getProportionateScreenHeight(10),
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenHeight(10)),
                          decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(10)),
                          height: SizeConfig.screenHeight / 4.7,
                          width: SizeConfig.screenWidth / 2.20,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${dashBoardController.dashBoard[0]['Total_Doctor']}",
                                    style: TextStyle(
                                        color: Color(0xff223263),
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(50)),
                                  ),
                                  Text(
                                    "TOTAL \nDOCTORS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(18)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.01,
                        ),
                        Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenHeight(10)),
                          decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(10)),
                          height: SizeConfig.screenHeight / 4.7,
                          width: SizeConfig.screenWidth / 2.20,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${dashBoardController.dashBoard[1]['Total_Employee']}",
                                  style: TextStyle(
                                      color: Color(0xff223263),
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          getProportionateScreenHeight(50)),
                                ),
                                Container(
                                  child: Text(
                                    "TOTAL \nEMPLOYEES",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(18)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 80,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(10),
                        ),
                      ),
                      height: SizeConfig.screenHeight / 4.7,
                      width: SizeConfig.screenWidth,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${dashBoardController.dashBoard[2]['Total_Sales']}",
                              style: TextStyle(
                                  color: Color(0xff223263),
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(50)),
                            ),
                            Text(
                              "TOTAL ORDERS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(20)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight / 80,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenHeight(10),
                        ),
                      ),
                      height: SizeConfig.screenHeight / 4.7,
                      width: SizeConfig.screenWidth,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${dashBoardController.dashBoard[3]['Total_Pending']}",
                              style: TextStyle(
                                  color: Color(0xff223263),
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(50)),
                            ),
                            Text(
                              "TOTAL PENDING",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(20)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
