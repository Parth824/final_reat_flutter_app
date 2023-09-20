import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../size_config.dart';
import '../homepage/homepage.dart';
import 'arggermentpage.dart';
import 'onlinepayment.dart';
import 'order_controller.dart';

class PaymentOrderPage extends StatefulWidget {
  const PaymentOrderPage({super.key});

  static String routeName = "/paymentorderpage";
  @override
  State<PaymentOrderPage> createState() => _PaymentOrderPageState();
}

class _PaymentOrderPageState extends State<PaymentOrderPage> {
  OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
      ),
      body: Container(
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
                GestureDetector(
                  onTap: () {
                    orderController.orderData.value.addAll({
                      'Installation': 'False',
                      'Payment_Type': 'Pending',
                      'Payment_Transfer_Name': 'COD',
                      'Agreement': 'False',
                      'Signature': '',
                      'O_Date':
                          '${DateFormat('yyyy-MM-dd').format(DateTime.now())}'
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("NOTICE"),
                          content: Text("You Sure To Confirm This Order..."),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                var k = await orderController.Cod(
                                    k: orderController.orderData.value);
                                if (k['result'] == 'insertion successfuly') {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      DoctorHomePage.routeName,
                                      (route) => false);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Order Confim..",
                                    ),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                } else {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      DoctorHomePage.routeName,
                                      (route) => false);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Order Filed..",
                                    ),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                  ));
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
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: SizeConfig.screenHeight / 6.5,
                    width: SizeConfig.screenWidth * 0.45,
                    child: Center(
                      child: Text(
                        "COD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ArggermentPage(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: SizeConfig.screenHeight / 6.5,
                    width: SizeConfig.screenWidth * 0.45,
                    child: Center(
                      child: Text(
                        "Pending",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight / 80,
            ),
            GestureDetector(
              onTap: () async {
                orderController.orderData.value.addAll({
                      'Installation': 'False',
                      'Payment_Type': 'Receiving',
                      'Payment_Transfer_Name': 'Online',
                      'Agreement': 'False',
                      'Signature': '',
                      'O_Date':
                          '${DateFormat('yyyy-MM-dd').format(DateTime.now())}'
                    });
                try {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OnlinePaymentPage(),
                    ),
                  );
                } catch (e) {}
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: SizeConfig.screenHeight / 6.5,
                child: Center(
                  child: Text(
                    "Online Payment",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
