import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rentapp22/globals.dart';
import 'package:get/get.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/expense/add_expense_alert.dart';
import 'package:rentapp22/views/screens/Admin/expense/controllers/expense_controller.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  static String routeName = '/expense';

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  ExpenseController expenseController = Get.put(ExpenseController());

  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    await expenseController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return (expenseController.expenselist.value.isNotEmpty)
            ? RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 1),
                    () {
                      expenseController.getData();
                    },
                  );
                },
                child: SizedBox(
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(15),
                      ),
                      itemCount: expenseController.expenselist.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(
                                          child: Text(
                                        "Bill Image",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      content: (expenseController.expenselist[i]
                                                  ['Bill_Image'] !=
                                              null)
                                          ? Image.network(
                                              "https://udservice.shop/Upload/${expenseController.expenselist[i]['Bill_Image']}",
                                            )
                                          : Container(),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: SizeConfig.screenHeight * 0.13,
                                width: SizeConfig.screenWidth * 0.95,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 1),
                                      color: Colors.black54,
                                      blurRadius: 7,
                                    ),
                                    BoxShadow(
                                        offset: Offset(-1, -1),
                                        color: Colors.white54,
                                        blurRadius: 7),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                          getProportionateScreenHeight(10),
                                        ),
                                        topLeft: Radius.circular(
                                          getProportionateScreenHeight(10),
                                        ),
                                      ),
                                      child: Container(
                                        height: SizeConfig.screenHeight * 0.13,
                                        width: SizeConfig.screenWidth * 0.3,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            Image.network(
                                              "https://udservice.shop/Upload/${expenseController.expenselist[i]['Bill_Image']}",
                                              fit: BoxFit.fill,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(15),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.screenWidth * 0.32,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              (expenseController.expenselist[i]
                                                          ['E_Id'] !=
                                                      null)
                                                  ? expenseController
                                                      .expenselist[i]['Name']
                                                  : "Admin",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize:
                                                    SizeConfig.screenHeight *
                                                        0.022,
                                              ),
                                            ),
                                            Text(
                                              expenseController.expenselist[i]
                                                  ['Categary'],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    SizeConfig.screenHeight *
                                                        0.02,
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      10),
                                            ),
                                            Text(
                                              expenseController.expenselist[i]
                                                  ['Ex_Date'],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    SizeConfig.screenHeight *
                                                        0.02,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Center(
                                                    child: Text(
                                                      "Description",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  content: Text(
                                                      expenseController
                                                              .expenselist[i]
                                                          ['Dect']),
                                                );
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Text(
                                          "${expenseController.expenselist[i]['Amount']}₹",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenHeight *
                                                      0.025,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                          ],
                        );
                      }),
                ),
              )
            : Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Add Expense"),
        tooltip: "Add Expense",
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialogExpense();
            },
          );
        },
      ),
    );
  }
}
