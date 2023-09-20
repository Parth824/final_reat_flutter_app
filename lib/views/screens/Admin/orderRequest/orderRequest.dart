import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:printing/printing.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/orderRequest/controllers/oreder_request_controller.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'listemployye.dart';

class OrderRequest extends StatefulWidget {
  const OrderRequest({super.key});

  static String routeName = '/orderrequest';

  @override
  State<OrderRequest> createState() => _OrderRequestState();
}

class _OrderRequestState extends State<OrderRequest> {
  OrderRequestController orderRequestController =
      Get.put(OrderRequestController());

  
  // final pdf1 = pw.Document();
  Uint8List? data1;
  Uint8List? data;
  @override
  void initState() {
    super.initState();
  }

  Future readNetworkImage(String imageUrl) async {
    final ByteData data =
        await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl);
    final Uint8List bytes = data.buffer.asUint8List();
    data1 = bytes;
    setState(() {});
  }

  Future makePDF1({var pdf}) async {
    final ByteData bytes = await rootBundle.load('assets/images/form.jpeg');
    final Uint8List byteList = bytes.buffer.asUint8List();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context1) => pw.Padding(
          padding: pw.EdgeInsets.only(left: 0),
          child: pw.Column(
            // crossAxisAlignment: pw.CrossAxisAlignment.center,
            // mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Container(
                height: 650,
                width: 1500,
                child: pw.Image(pw.MemoryImage(byteList), fit: pw.BoxFit.fill),
              ),
              pw.Row(
                children: [
                  pw.Text(
                    "Signature",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline,
                    ),
                  ),
                  pw.Spacer(),
                  pw.SizedBox(width: 30),
                  pw.Container(
                    height: 50,
                    width: 120,
                    alignment: pw.Alignment.center,
                    color: PdfColors.green50,
                    child: (data1 == null)
                        ? pw.Container(
                            child: pw.Text(""),
                          )
                        : pw.Image(
                            pw.MemoryImage(data1!),
                            fit: pw.BoxFit.cover,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  makePDF({var pdf}) async {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context1) => pw.Column(
          children: [
            pw.Expanded(
              flex: 14,
              child: pw.Column(
                children: [
                  pw.Row(
                    children: [
                      pw.Text(
                        "Agreement for Printers on Hire",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 2,
                  ),
                  pw.Text(
                      "THIS AGREEMENT (the “Agreement”) is made as on between\nM/s UD SERVICES , Herein after referred to as ‘’M/s UD SERVICES” withs its official address at K-201 Rajhans Apple Palanpur Jakatnaka Surat\nAnd\nKASTURBA VAIDYAKIYA RAHAT MANDAL(KASTURBA HOSPITAL)\nLALA LAJPATRAI ROAD, MOTA TAIWAD VALSAD\nGUJARAT-396001",
                      style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(
                    height: 3,
                  ),
                  pw.Container(
                    height: 2,
                    width: double.infinity,
                    color: PdfColors.grey,
                  ),
                  pw.SizedBox(
                    height: 3,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Section 01- Scope of UD SERVICES",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 2,
                  ),
                  pw.Text(
                      "1.Scope of ’M/s UD SERVICES shall be to supply printer.\n2.Supply of Ink.\n3.Supply of A2 PVC white film,Matt.,Glossy Paper and 260gsm RC paper.\n2. UD SERVICES shall make sure that machines are up & running and will do whatever required for uninterrupted printing.",
                      style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(
                    height: 3,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Section 02- Scope of UD Client",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 2,
                  ),
                  pw.Text(
                      "1.Client should provide the proper place with power connection for printer.\n2.Client should have moisture free storage for photo paper\n3.Insurance has to be taken care from customer’s end.",
                      style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(
                    height: 3,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Section 03- Commercial Term of Contract",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 2,
                  ),
                  pw.Text(
                      "Contract is from INSTALLATION   for a period of 22 months, on agreed terms and conditions on renewal.\nCommercials: Per print or Print counts.\nRs.16/ Per print FOR A2\nRs.32/ Per print FOR A3\nRS 2200 INSTALLATION CHARGE PER PRINTER\nTaxes , as applicable,extra.",
                      style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(
                    height: 3,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Section 02- Standard of performance",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 2,
                  ),
                  pw.Text(
                      ". WO/PO in the name of “UD SERVICES’’\n.Payment to be made in name of “UD SERVICES’’\n.Bills will be raised on monthly basis at the end of the month.\n.Payment within 30 days of bill submission.",
                      style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(
                    height: 3,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Section 05- Ownership of Materials",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 2,
                  ),
                  pw.Text(
                      "The printers and Dicom softwares keys  provided, with ownership of M/s UD SERVICES and have reserved the right to use the printers and software’s  at customers site.\nM/S UD Services own the Capex of Printer and Software at Clients Premises.\nHospital should take care of the Assets in their premises installed by M/s UD SERVICES and shall be liable to pay against any loss, damage of any kind to assets, will be billed as per the market price.\nUD SERVICES will be taking care of the all maintenance and consumable for the assest installed by company, hence by providing the hazel free operation.\nFor Assets (PRINTER AND SOFTWARES KEYS)     provide by M/s UD SERVICES , if any loss, damage of any kind to assets, will be billed per the market price.",
                      style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(
                    height: 3,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Section 06-Termination",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          decoration: pw.TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 2,
                  ),
                  pw.Text(
                      "Both the parties to the contract shall have the right to terminate this Agreement before the Completion Date by giving one month’s prior written notice to the others party for 22 day.",
                      style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Row(
                children: [
                  pw.Text(
                    "Signature",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      decoration: pw.TextDecoration.underline,
                    ),
                  ),
                  pw.Spacer(),
                  pw.SizedBox(width: 30),
                  pw.Container(
                    height: 50,
                    width: 120,
                    alignment: pw.Alignment.center,
                    color: PdfColors.green50,
                    child: (data1 == null)
                        ? pw.Container(
                            child: pw.Text(""),
                          )
                        : pw.Image(
                            pw.MemoryImage(data1!),
                            fit: pw.BoxFit.cover,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: orderRequestController.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return Obx(
                () => (orderRequestController.orderRequest.isEmpty)
                    ? Center(
                        child: Image.asset("assets/images/no-data.png"),
                      )
                    : ListView.builder(
                        reverse: true,
                        itemCount: orderRequestController.orderRequest.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(
                                getProportionateScreenHeight(10)),
                            child: Container(
                              height: SizeConfig.screenHeight * .21,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenHeight(10)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 5),
                                    color: Colors.black26,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  titleBar(
                                    index: orderRequestController
                                        .orderRequest[index],
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(10),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height:
                                                SizeConfig.screenHeight * 0.15,
                                            padding: EdgeInsets.only(
                                              left:
                                                  getProportionateScreenHeight(
                                                      5),
                                              top: getProportionateScreenHeight(
                                                  0),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                typeData(
                                                    "Paper Type",
                                                    orderRequestController
                                                            .orderRequest[index]
                                                        ['Paper_Size'],
                                                    Colors.black,
                                                    Colors.grey),
                                                typeData(
                                                    "Ink",
                                                    orderRequestController
                                                            .orderRequest[index]
                                                        ['I_Id'],
                                                    Colors.black,
                                                    Colors.grey),
                                                typeData(
                                                    "Jelly",
                                                    orderRequestController
                                                            .orderRequest[index]
                                                        ['J_Id'],
                                                    Colors.black,
                                                    Colors.grey),
                                                typeData(
                                                    "Paper Qut",
                                                    orderRequestController
                                                            .orderRequest[index]
                                                        ['Paper_Quty'],
                                                    Colors.black,
                                                    Colors.grey),
                                                typeData(
                                                    "M.R.P",
                                                    orderRequestController
                                                            .orderRequest[index]
                                                        ['Amount'],
                                                    Colors.green,
                                                    Colors.green),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  OutlinedButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title:
                                                                Text("Worring"),
                                                            content: Text(
                                                                "You Sure To Cancel This Order Request..."),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                  "Cancel",
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  var data =
                                                                      await orderRequestController
                                                                          .DeleteOrder(
                                                                              k: {
                                                                        'O_Id': orderRequestController.orderRequest[index]
                                                                            [
                                                                            'O_Id'],
                                                                      });
                                                                  if (data[
                                                                          'result'] ==
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
                                                                          Colors
                                                                              .green,
                                                                      behavior:
                                                                          SnackBarBehavior
                                                                              .floating,
                                                                    ));
                                                                    await orderRequestController
                                                                        .getData();
                                                                  } else {
                                                                    Navigator.pop(
                                                                        context);
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text("Fali.."),
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                        behavior:
                                                                            SnackBarBehavior.floating,
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
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) {
                                                            return ListEmployye();
                                                          },
                                                          settings: RouteSettings(
                                                              arguments:
                                                                  orderRequestController
                                                                              .orderRequest[
                                                                          index]
                                                                      ['O_Id']),
                                                        ),
                                                      );
                                                    },
                                                    child: Text(
                                                      "Confirm",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }

  typeData(String name, String type, Color HedingColor, Color ValueColor) {
    return Row(
      children: [
        Container(
          width: SizeConfig.screenWidth * .25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(14),
                  // fontWeight: FontWeight.bold,
                  color: HedingColor,
                ),
              ),
              Text(
                ":",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(14),
                  // fontWeight: FontWeight.bold,
                  color: HedingColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.screenHeight * .02,
        ),
        Container(
          width: SizeConfig.screenWidth * .21,
          height: SizeConfig.screenHeight * .03,
          child: Text(
            type,
            style: TextStyle(
                fontSize: getProportionateScreenHeight(13),
                // fontWeight: FontWeight.w500,
                color: ValueColor),
          ),
        ),
      ],
    );
  }

  titleBar({required Map index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (index['Agreement'] == "Ture")
                  ? IconButton(
                      onPressed: () async {
                        if (index['Signature'] != null &&
                            index['Signature'] != "") {
                          print("Parth");
                          String imageUrl =
                              "https://udservice.shop/Upload/${index['Signature']}";

                          await readNetworkImage(imageUrl);
                        } else {
                          data1 = null;
                          setState(() {});
                        }
                        pw.Document pdf = pw.Document();
                        await makePDF(pdf: pdf);
                        Uint8List data = await pdf.save();
                        await Printing.layoutPdf(onLayout: (format) => data);
                      },
                      icon: Icon(Icons.picture_as_pdf_outlined),
                    )
                  : Container(),
              (index['Installation'] == "Ture")
                  ? IconButton(
                      onPressed: () async {
                        if (index['Signature'] != null &&
                            index['Signature'] != "") {
                          print("Parth");
                          String imageUrl =
                              "https://udservice.shop/Upload/${index['Signature']}";

                          await readNetworkImage(imageUrl);
                        } else {
                          data1 = null;
                          setState(() {});
                        }
                        pw.Document pdf = pw.Document();
                        await makePDF1(pdf: pdf);
                        Uint8List data = await pdf.save();
                        await Printing.layoutPdf(onLayout: (format) => data);
                      },
                      icon: Icon(Icons.picture_as_pdf_sharp),
                    )
                  : Container(),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: getProportionateScreenHeight(5),
              top: getProportionateScreenHeight(5),
              bottom: getProportionateScreenHeight(1.5),
            ),

            width: SizeConfig.screenWidth * .4,
            // height: ,
            child: Text(
              index["Printer_Name"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenHeight(13),
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
