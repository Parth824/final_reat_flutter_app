import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';
import 'package:get/get.dart';
import '../../../../size_config.dart';
import 'order_controller.dart';
import '../homepage/homepage.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class OnlinePaymentPage extends StatefulWidget {
  const OnlinePaymentPage({super.key});

  @override
  State<OnlinePaymentPage> createState() => _OnlinePaymentPageState();
}

class _OnlinePaymentPageState extends State<OnlinePaymentPage> {
  OrderController orderController = Get.put(OrderController());
  //TODO Change UPI ID
  UPIDetails? upiDetails;
  final upiDetailsWithoutAmount = UPIDetails(
    upiID: "udimaging@barodampay",
    payeeName: "Agnel Selvan",
    transactionNote: "Hello World",
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  getdata()
  {
    upiDetails = UPIDetails(
      upiID: (orderController.type.value =="Flims" || orderController.type.value =="Jelly")?"udimaging@barodampay":"Udservices@barodampay",
      payeeName: (orderController.type.value =="Flims" || orderController.type.value =="Jelly")?"udimaging":"Udservices",
      amount: double.parse(orderController.orderData['Amount']),
      transactionNote: "Hello World");

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UPI Payment QRCode Generator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
                height: getProportionateScreenHeight(150),
              ),              
              const Text("UPI Payment QRCode with Amount",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              UPIPaymentQRCode(
                upiDetails: upiDetails!,
                size: 220,
                upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
              ),
              Text(
                "Scan QR to Pay",
                style: TextStyle(color: Colors.grey[600], letterSpacing: 1.2),
              ),
              SizedBox(
                height: getProportionateScreenHeight(150),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("NOTICE"),
                          content:
                              Text("You Sure To Confirm This Order If payment is done ok clik..."),
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
                  child: Text(
                    "Confirm Order",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//   Future<UpiResponse>? _transaction;
//   UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;

//   TextStyle header = TextStyle(
//     fontSize: 18,
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//   );

//   TextStyle value = TextStyle(
//     color: Colors.black,
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//   );

//   @override
//   void initState() {
//     _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
//       setState(() {
//         apps = value;
//       });
//     }).catchError((e) {
//       apps = [];
//     });
//     super.initState();
//   }

//   Future<UpiResponse> initiateTransaction(UpiApp app) async {
//     return _upiIndia.startTransaction(
//       app: app,
//       receiverUpiId: (orderController.type.value == "Flims")?"7621839795@paytm":"7621839795@paytm",
//       receiverName: 'Zeel',
//       transactionRefId: 'TestingUpiIndiaPlugin',
//       transactionNote: 'Not actual. Just an example.',
//       amount: 10,
//     );
//   }

//   Widget displayUpiApps() {
//     if (apps == null)
//       return Center(child: CircularProgressIndicator());
//     else if (apps!.length == 0)
//       return Center(
//         child: Text(
//           "No apps found to handle transaction.",
//           style: header,
//         ),
//       );
//     else
//       return Align(
//         alignment: Alignment.topCenter,
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Wrap(
//             children: apps!.map<Widget>((UpiApp app) {
//               return GestureDetector(
//                 onTap: () {
//                   _transaction = initiateTransaction(app);
//                   setState(() {});
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.memory(
//                         app.icon,
//                         height: 60,
//                         width: 60,
//                       ),
//                       Text(app.name),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//   }

//   String _upiErrorHandler(error) {
//     switch (error) {
//       case UpiIndiaAppNotInstalledException:
//         return 'Requested app not installed on device';
//       case UpiIndiaUserCancelledException:
//         return 'You cancelled the transaction';
//       case UpiIndiaNullResponseException:
//         return 'Requested app didn\'t return any response';
//       case UpiIndiaInvalidParametersException:
//         return 'Requested app cannot handle the transaction';
//       default:
//         return 'An Unknown error has occurred';
//     }
//   }

//   void _checkTxnStatus(String status,BuildContext context) async{
//     switch (status) {
//       case UpiPaymentStatus.SUCCESS:
//         print('Transaction Successful');
//         var k = await orderController.Cod(
//                                     k: orderController.orderData.value);
//                                 if (k['result'] == 'insertion successfuly') {
//                                   Navigator.pushNamedAndRemoveUntil(
//                                       context,
//                                       DoctorHomePage.routeName,
//                                       (route) => false);
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(
//                                       "Order Confim..",
//                                     ),
//                                     backgroundColor: Colors.green,
//                                     behavior: SnackBarBehavior.floating,
//                                   ));
//                                 } else {
//                                   Navigator.pushNamedAndRemoveUntil(
//                                       context,
//                                       DoctorHomePage.routeName,
//                                       (route) => false);
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(SnackBar(
//                                     content: Text(
//                                       "Order Filed..",
//                                     ),
//                                     backgroundColor: Colors.red,
//                                     behavior: SnackBarBehavior.floating,
//                                   ));
//                                 }
//         break;
//       case UpiPaymentStatus.SUBMITTED:
//         print('Transaction Submitted');
//         break;
//       case UpiPaymentStatus.FAILURE:
//         print('Transaction Failed');
//         break;
//       default:
//         print('Received an Unknown transaction status');
//     }
//   }

//   Widget displayTransactionData(title, body) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("$title: ", style: header),
//           Flexible(
//               child: Text(
//             body,
//             style: value,
//           )),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('UPI'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: displayUpiApps(),
//           ),
//           Expanded(
//             child: FutureBuilder(
//               future: _transaction,
//               builder:
//                   (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text(
//                         _upiErrorHandler(snapshot.error.runtimeType),
//                         style: header,
//                       ), // Print's text message on screen
//                     );
//                   }

//                   // If we have data then definitely we will have UpiResponse.
//                   // It cannot be null
//                   UpiResponse _upiResponse = snapshot.data!;

//                   // Data in UpiResponse can be null. Check before printing
//                   String txnId = _upiResponse.transactionId ?? 'N/A';
//                   String resCode = _upiResponse.responseCode ?? 'N/A';
//                   String txnRef = _upiResponse.transactionRefId ?? 'N/A';
//                   String status = _upiResponse.status ?? 'N/A';
//                   String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
//                   _checkTxnStatus(status,context);

//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         displayTransactionData('Transaction Id', txnId),
//                         displayTransactionData('Response Code', resCode),
//                         displayTransactionData('Reference Id', txnRef),
//                         displayTransactionData('Status', status.toUpperCase()),
//                         displayTransactionData('Approval No', approvalRef),
//                       ],
//                     ),
//                   );
//                 } else
//                   return Center(
//                     child: Text(""),
//                   );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
