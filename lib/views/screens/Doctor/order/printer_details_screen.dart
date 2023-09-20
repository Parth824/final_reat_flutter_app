import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Doctor/order/order_controller.dart';
import 'package:rentapp22/views/screens/Doctor/order/rent_controller.dart';
import '../../../../main.dart';
import '../../../../size_config.dart';
import 'payment_order_page.dart';

class PrinterDetails extends StatefulWidget {
  const PrinterDetails({super.key});
  static String routeName = "/printerdetails";
  @override
  State<PrinterDetails> createState() => _PrinterDetailsState();
}

class _PrinterDetailsState extends State<PrinterDetails> {
  // List Inki = ["BK", "M", "LM", "C", "LC", "YK"];
  List Jelly = [
    {'name': "250 ml", "price": "18"},
    {"name": "1 kg", "price": "80"},
    {"name": "5 kg", "price": "400"}
  ];
  // List X_ray_fimli = [
  //   "8 X 10",
  //   "10 X 12",
  //   "11 X 14",
  //   "14 X 17",
  // ];

  RentController rentController = Get.put(RentController());
  OrderController orderController = Get.put(OrderController());
  // Widget InkData({required List Inki}) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [
  //         ...Inki.map(
  //           (e) => Padding(
  //             padding: EdgeInsets.all(getProportionateScreenHeight(2)),
  //             child: GestureDetector(
  //               onTap: () {
  //                 print(e);
  //                 rentController.setInk(k: e);
  //               },
  //               child: Obx(
  //                 () => Container(
  //                   height: SizeConfig.screenHeight * 0.05,
  //                   width: SizeConfig.screenWidth * 0.2,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     border: Border.all(
  //                         color: (rentController.Ink.contains(e))
  //                             ? Colors.blue
  //                             : Colors.grey,
  //                         width: getProportionateScreenHeight(2)),
  //                   ),
  //                   alignment: Alignment.center,
  //                   child: Text(
  //                     e,
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ).toList(),
  //       ],
  //     ),
  //   );
  // }

  // Widget X_RayData({required List X_ray_fimli}) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [
  //         ...X_ray_fimli.map(
  //           (e) => Padding(
  //             padding: EdgeInsets.all(getProportionateScreenHeight(2)),
  //             child: GestureDetector(
  //               onTap: () {
  //                 rentController.setXraw(k: e);
  //               },
  //               child: Obx(
  //                 () => Container(
  //                   height: SizeConfig.screenHeight * 0.05,
  //                   width: SizeConfig.screenWidth * 0.2,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     border: Border.all(
  //                         color: (rentController.X_raw.contains(e))
  //                             ? Colors.blue
  //                             : Colors.grey,
  //                         width: getProportionateScreenHeight(2)),
  //                   ),
  //                   alignment: Alignment.center,
  //                   child: Text(
  //                     e,
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ).toList(),
  //       ],
  //     ),
  //   );
  // }

  Widget JellyData({required List Jelly}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...Jelly.map(
            (e) => Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(2)),
              child: GestureDetector(
                onTap: () {
                  rentController.setJayy(k: e);
                },
                child: Obx(
                  () => Container(
                    height: SizeConfig.screenHeight * 0.05,
                    width: SizeConfig.screenWidth * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: (rentController.Jally.contains(e))
                              ? Colors.blue
                              : Colors.grey,
                          width: getProportionateScreenHeight(2)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      e['name'],
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).toList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map k = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Rent Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight * .3,
              width: double.infinity,
              child: Center(
                child: Text(
                  k['Pro_Name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(35),
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(10)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    child: Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * 0.5,
                          height: SizeConfig.screenHeight * 0.05,
                          child: Text(
                            k['Pro_Name'],
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(22),
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "₹ ${k['Pro_Price']}",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(22),
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .012,
                  ),
                  Text(
                    "Product Description",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    child: Text(
                      k['Pro_Description'],
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(17),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .012,
                  ),
                  (k['Pro_Type'] == 'Paper')
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Paper",
                                style: TextStyle(
                                  fontSize: getProportionateScreenHeight(16),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              width: SizeConfig.screenHeight * .13,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      rentController.subPaper();
                                    },
                                    child: Icon(
                                      AntDesign.minussquare,
                                      size: getProportionateScreenHeight(25),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      "${rentController.Paper}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            getProportionateScreenHeight(18),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      rentController.addPaper();
                                    },
                                    child: Icon(
                                      AntDesign.plussquare,
                                      size: getProportionateScreenHeight(25),
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  (k['Pro_Type'] == 'Paper')
                      ? SizedBox(
                          height: SizeConfig.screenHeight * .012,
                        )
                      : Container(),
                  // (k['Pro_Type'] == 'Ink')
                  //     ? Text(
                  //         "Select Ink",
                  //         style: TextStyle(
                  //           fontSize: getProportionateScreenHeight(16),
                  //           color: Colors.grey,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       )
                  //     : Container(),
                  // (k['Pro_Type'] == 'Ink')
                  //     ? SizedBox(
                  //         height: SizeConfig.screenHeight * .012,
                  //       )
                  //     : Container(),
                  // (k['Pro_Type'] == 'InK')
                  //     ? InkData(
                  //         Inki: Inki,
                  //       )
                  //     : Container(),
                  // (k['Pro_Type'] == 'Ink')
                  //     ? SizedBox(
                  //         height: SizeConfig.screenHeight * .012,
                  //       )
                  //     : Container(),
                  Text(
                    "Select Jelly",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(16),
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * .012,
                  ),
                  JellyData(Jelly: Jelly),
                  SizedBox(
                    height: SizeConfig.screenHeight * .012,
                  ),
                  // (k['Pro_Type'] == 'Flims')
                  //     ? Text(
                  //         "Select X-Ray Filmis",
                  //         style: TextStyle(
                  //           fontSize: getProportionateScreenHeight(16),
                  //           color: Colors.grey,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       )
                  //     : Container(),
                  // (k['Pro_Type'] == 'Flims')
                  //     ? SizedBox(
                  //         height: SizeConfig.screenHeight * .012,
                  //       )
                  //     : Container(),
                  // (k['Pro_Type'] == 'Flims')
                  //     ? X_RayData(X_ray_fimli: X_ray_fimli)
                  //     : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: SizeConfig.screenHeight * .09,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Obx(
              () => Text(
                "₹ ${rentController.reat}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenHeight(
                    22,
                  ),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Container(
              height: SizeConfig.screenHeight * .07,
              width: SizeConfig.screenWidth * .5,
              child: ElevatedButton(
                onPressed: () {
                  orderController.orderData.value = {};
                  if (rentController.reat.value > 300) {
                    orderController.type.value = k['Pro_Type'];
                    orderController.orderData.value = {
                      "Printer_Name": "${k['Pro_Name']}",
                      "Paper_Quty": "${rentController.Paper}",
                      "J_Id": (k['Pro_Type'] == "Jelly")
                          ? "${k['Pro_Name']}"
                          : "null",
                      "I_Id": (k['Pro_Type'] == "Ink")
                          ? "${k['Pro_Name']}"
                          : "null",
                      "F_Id": (k['Pro_Type'] == "Flims")
                          ? "${k['Pro_Name']}"
                          : "null",
                      "Order_Received": "not confirm",
                      "D_Id": "${sharedPreferences.getString("Id")}",
                      "Amount": "${rentController.reat}",
                      "Unit": "${k['Pro_Unit']}",
                      "GST": "${k['GST']}"
                    };
                    Navigator.of(context).pushNamed(PaymentOrderPage.routeName);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(child: Text("Notice")),
                          content: Text(
                            "palscr ₹300 + you can order ",
                            style: TextStyle(color: Colors.red),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text("Rent"),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
