// import 'package:flutter/material.dart';

// import '../../../../globals.dart';
// import '../../../../size_config.dart';

// class SalesReportPage extends StatefulWidget {
//   const SalesReportPage({super.key});

//   static String routeName = '/totalsales';

//   @override
//   State<SalesReportPage> createState() => _SalesReportPageState();
// }

// class _SalesReportPageState extends State<SalesReportPage> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body: Container(
//         height: SizeConfig.screenHeight,
//         width: SizeConfig.screenWidth,
//         padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
//         child: Column(children: [
//           SizedBox(height: SizeConfig.screenHeight*0.01,),
//           ...Sales.map((e) => Card(
//                 color: Colors.blue.shade100,
//                 child: ListTile(
//                   isThreeLine: true,
//                   title: Text(
//                     e["hospital"],
//                     style: TextStyle(
//                         fontSize: SizeConfig.screenWidth * 0.042,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Invoice No. ${e["invoice"]}",
//                         style: TextStyle(
//                             fontSize: SizeConfig.screenWidth * 0.042,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         e["date"],
//                         style: TextStyle(
//                             fontSize: SizeConfig.screenWidth * 0.042,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                   trailing: Container(
//                     height: SizeConfig.screenHeight,
//                     child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
//                       Text(
//                         "Rs.${e["amount"]}.00",
//                         style: TextStyle(
//                           color: Colors.black,
//                             fontSize: SizeConfig.screenWidth * 0.042,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       (e["status"] == "Pending")
//                           ? Container(
//                               alignment: Alignment.center,
//                               height: SizeConfig.screenWidth * 0.075,
//                               width: SizeConfig.screenWidth * 0.25,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                       SizeConfig.screenWidth * 0.02),
//                                   color: Colors.red),
//                               child: Center(
//                                 child: Text(
//                                   "Pending",
//                                   style: TextStyle(
//                                       fontSize: SizeConfig.screenWidth * 0.042,
//                                       // letterSpacing: 2,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             )
//                           : Container(
//                               alignment: Alignment.center,
//                               height: SizeConfig.screenWidth * 0.075,
//                               width: SizeConfig.screenWidth * 0.25,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                       SizeConfig.screenWidth * 0.02),
//                                   color: Colors.green),
//                               child: Text(
//                                 "Received",
//                                 style: TextStyle(
//                                   fontSize: SizeConfig.screenWidth * 0.042,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             )
//                     ]),
//                   ),
//                 ),
//               ))
//         ]),
//       ),
//     );
//   }
// }

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../components/default_button.dart';
import '../../../../size_config.dart';
import '../../Employee/dailyexpenses/expenses_data.dart';
import 'controllers/total_sales_controllers.dart';

class SalesReportPage extends StatefulWidget {
  const SalesReportPage({super.key});

  static String routeName = '/salesreport';

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  DateTime _selectedDate1 = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day - 1);
  DateTime _selectedDate2 = DateTime.now();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _searchEditingController = TextEditingController();
  String? date1;
  String? date2;
  String? search;
  TotalSalesController totalSalesController = Get.put(TotalSalesController());
  int rate = 0;
  int textble = 0;
  int cgst = 0;
  int sgst = 0;
  int total = 0;
  int i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController1
      ..text = DateFormat("yyyy-MM-dd").format(_selectedDate1);
    _textEditingController2
      ..text = DateFormat("yyyy-MM-dd").format(_selectedDate2);
  }

  makePDF({var pdf, required List data, required String o}) async {
    rate = 0;
    textble = 0;
    cgst = 0;
    sgst = 0;
    total = 0;
    pdf.addPage(
      pw.Page(
        build: (pw.Context context1) => pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              "UD HEALTH CARE",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              "24AARHM0921M1ZY)",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.Text(
              "Shop no.G5 Rajhans Stadium Plaza near New L.P.Savani School",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 14,
              ),
            ),
            pw.SizedBox(
              height: 25,
            ),
            pw.Text(
              "PRODUCT WISE SALES REPORT",
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              o,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(
              height: 10,
            ),
            pw.Table(
              defaultColumnWidth: pw.FixedColumnWidth(120.0),
              border: pw.TableBorder.all(
                color: PdfColors.black,
                style: pw.BorderStyle.solid,
              ),
              children: [
                pw.TableRow(
                  children: [
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Index',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Invoice No',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Buyer Name',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Date',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Quantity',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Rate',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Taxable AMT',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'CGST',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'SGST',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Total',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ...data.map((e) {
                  rate = rate + int.parse(e['Amount']);
                  textble = textble + int.parse(e['Amount']);
                  cgst = (cgst + (int.parse(e['Amount']) * int.parse(e['GST']))).toInt();
                  sgst = (sgst + (int.parse(e['Amount']) * int.parse(e['GST']))).toInt();
                  total = (total +
                          int.parse(e['Amount']) +
                          (int.parse(e['Amount']) * int.parse(e['GST'])) +
                          (int.parse(e['Amount']) * int.parse(e['GST'])))
                      .toInt();
                  i = i + 1;
                  return pw.TableRow(
                    children: [
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            '${i}',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            e['O_Id'],
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            "${e['First_Name']} ${e['Last_Name']}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            e['O_Date'],
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            "${e['Unit']}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            e['Amount'],
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            "${e['Amount']}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            "${int.parse(e['Amount']) * int.parse(e['GST'])}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            "${int.parse(e['Amount']) * int.parse(e['GST'])}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text(
                            "${int.parse(e['Amount']) + (int.parse(e['Amount']) * int.parse(e['GST'])) + (int.parse(e['Amount']) * int.parse(e['GST']))}",
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
                pw.TableRow(
                  children: [
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "$rate",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "$textble",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "$cgst",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "$sgst",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "$total",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map k = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(k['Name']),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(getProportionateScreenHeight(12)),
                height: SizeConfig.screenHeight * 0.08,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(
                        getProportionateScreenHeight(15))),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "FROM : ",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.05,
                        width: SizeConfig.screenWidth * 0.26,
                        child: Center(
                          child: TextFormField(
                            controller: _textEditingController1,
                            onSaved: (val) {
                              date1 = val;
                            },
                            validator: (val) {
                              if (val!.isEmpty) {}
                              return null;
                            },
                            onTap: () async {
                              DateTime? newSelectedDate = await showDatePicker(
                                context: context,
                                initialDate: _selectedDate1 != null
                                    ? _selectedDate1!
                                    : DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2040),
                              );

                              if (newSelectedDate != null) {
                                _selectedDate1 = newSelectedDate;
                                _textEditingController1
                                  ..text = DateFormat("yyyy-MM-dd")
                                      .format(_selectedDate1!)
                                  ..selection = TextSelection.fromPosition(
                                      TextPosition(
                                          offset: _textEditingController1
                                              .text.length,
                                          affinity: TextAffinity.upstream));
                                await totalSalesController.getDataDoctor(k: {
                                  'DATE1':
                                      "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                                  'DATE2':
                                      "${DateFormat('yyyy-MM-dd').format(_selectedDate2)}",
                                  "D_Id": k['Id']
                                });
                              }
                            },
                            focusNode: AlwaysDisabledFocusNode(),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(8),
                                  horizontal: getProportionateScreenHeight(8)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * 0.01),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * 0.01),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * 0.01),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(10),
                      ),
                      Text(
                        "TO : ",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(16),
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.05,
                        width: SizeConfig.screenWidth * 0.26,
                        child: Center(
                          child: TextFormField(
                            controller: _textEditingController2,
                            onSaved: (val) {
                              date2 = val;
                            },
                            validator: (val) {
                              if (val!.isEmpty) {}
                              return null;
                            },
                            onTap: () async {
                              DateTime? newSelectedDate = await showDatePicker(
                                context: context,
                                initialDate: _selectedDate2 != null
                                    ? _selectedDate2!
                                    : DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2040),
                              );

                              if (newSelectedDate != null) {
                                _selectedDate2 = newSelectedDate;
                                _textEditingController2
                                  ..text = DateFormat("yyyy-MM-dd")
                                      .format(_selectedDate2!)
                                  ..selection = TextSelection.fromPosition(
                                      TextPosition(
                                          offset: _textEditingController2
                                              .text.length,
                                          affinity: TextAffinity.upstream));
                                await totalSalesController.getDataDoctor(k: {
                                  'DATE1':
                                      "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                                  'DATE2':
                                      "${DateFormat('yyyy-MM-dd').format(_selectedDate2)}",
                                  "D_Id": k['Id']
                                });
                              }
                            },
                            focusNode: AlwaysDisabledFocusNode(),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: getProportionateScreenHeight(8),
                                  horizontal: getProportionateScreenHeight(8)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * 0.01),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * 0.01),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenHeight * 0.01),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: SizeConfig.screenHeight * 0.06,
              //   margin: EdgeInsets.symmetric(
              //       horizontal: getProportionateScreenHeight(12)),
              //   child: TextFormField(
              //     controller: _searchEditingController,
              //     onSaved: (val) {
              //       search = val!;
              //     },
              //     validator: (val) {},
              //     onTap: () {},
              //     textInputAction: TextInputAction.next,
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.symmetric(
              //           vertical: getProportionateScreenHeight(8),
              //           horizontal: getProportionateScreenHeight(8)),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius:
              //             BorderRadius.circular(SizeConfig.screenHeight * 0.03),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius:
              //             BorderRadius.circular(SizeConfig.screenHeight * 0.03),
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius:
              //             BorderRadius.circular(SizeConfig.screenHeight * 0.03),
              //       ),
              //       prefixIcon: Icon(Icons.search_rounded),
              //       hintText: "Search",
              //       hintStyle: TextStyle(),
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(10),
                ),
                height: SizeConfig.screenHeight * 0.6,
                child: FutureBuilder(
                  future: totalSalesController.getDataDoctor(k: {
                    'DATE1':
                        "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                    'DATE2':
                        "${DateFormat('yyyy-MM-dd').format(_selectedDate2)}",
                    "D_Id": k['Id']
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Obx(
                        () => (totalSalesController.allDoctorData.isEmpty)
                            ? Center(
                                child: Image.asset(
                                  "assets/images/no-data.png",
                                ),
                              )
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    totalSalesController.allDoctorData.length,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getProportionateScreenHeight(12)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              SizeConfig.screenHeight * 0.18,
                                          width: SizeConfig.screenWidth * 1,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      getProportionateScreenHeight(
                                                          10)),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          getProportionateScreenHeight(
                                                              10)),
                                                      topRight: Radius.circular(
                                                          getProportionateScreenHeight(
                                                              10)),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Buyer Name",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            "${totalSalesController.allDoctorData[i]['First_Name']} ${totalSalesController.allDoctorData[i]['Last_Name']} ",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        14),
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Invoice No.",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            "${totalSalesController.allDoctorData[i]['O_Id']}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        14),
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Date",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            "${totalSalesController.allDoctorData[i]['O_Date']}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        14),
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      getProportionateScreenHeight(
                                                          10)),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft: Radius.circular(
                                                          getProportionateScreenHeight(
                                                              10)),
                                                      bottomRight: Radius.circular(
                                                          getProportionateScreenHeight(
                                                              10)),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Rate",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            "₹ ${totalSalesController.allDoctorData[i]['Amount']}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        14),
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Quantity",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        14),
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: SizeConfig
                                                                .screenWidth *
                                                            0.0,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Total Amt.",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        15),
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            "₹ ${totalSalesController.allDoctorData[i]['Amount']}",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenHeight(
                                                                        14),
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.screenHeight * 0.02,
                                        ),
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
              ),
              Container(
                height: SizeConfig.screenHeight * 0.07,
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(12),
                  vertical: getProportionateScreenHeight(15),
                ),
                child: DefaultButton(
                    text: "Genrate",
                    press: () async {
                      pw.Document pdf = pw.Document();
                      await makePDF(
                          pdf: pdf,
                          data: totalSalesController.allDoctorData.value,
                          o: k['Name']);
                      Uint8List data = await pdf.save();
                      await Printing.layoutPdf(onLayout: (format) => data);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
