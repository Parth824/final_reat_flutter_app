// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:printing/printing.dart';
// import 'package:rent_app1/size_config.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// import '../../../../../globals.dart';
//
// class StatementDoctor extends StatefulWidget {
//   const StatementDoctor({super.key});
//
//   @override
//   State<StatementDoctor> createState() => _StatementDoctorState();
// }
//
// class _StatementDoctorState extends State<StatementDoctor> {
//   final pdf = pw.Document();
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       height: SizeConfig.screenHeight,
//       width: SizeConfig.screenWidth,
//       padding: EdgeInsets.only(
//           top: MediaQuery.of(context).size.width * 0.0233,
//           bottom: MediaQuery.of(context).size.width * 0.0233,
//           left: MediaQuery.of(context).size.width * 0.00456,
//           right: MediaQuery.of(context).size.width * 0.00456),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: SizeConfig.screenHeight * 0.08,
//               width: SizeConfig.screenWidth,
//               decoration: BoxDecoration(color: Colors.blue.shade300),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.filter_alt,
//                           size: MediaQuery.of(context).size.width * 0.093,
//                         ),
//                         SizedBox(
//                           width: SizeConfig.screenWidth * 0.02,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Duration",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize:
//                                       MediaQuery.of(context).size.width * 0.037,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "9 jun 2022 - Today",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize:
//                                           MediaQuery.of(context).size.width *
//                                               0.0325,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Icon(Icons.arrow_drop_down)
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       GestureDetector(
//                           onTap: () async {
//                             Uint8List data = await pdf.save();
//                             await Printing.layoutPdf(
//                                 onLayout: (format) => data);
//                           },
//                           child: Icon(
//                             Icons.picture_as_pdf,
//                             size: MediaQuery.of(context).size.width * 0.081,
//                           )),
//                       SizedBox(
//                         width: SizeConfig.screenWidth * 0.05,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: SizeConfig.screenHeight * 0.01,
//             ),
//             Container(
//               height: SizeConfig.screenHeight * 0.05,
//               decoration: BoxDecoration(color: Colors.grey.shade300),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     flex: 3,
//                     child: Container(
//                       child: Text(
//                         "Date",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: MediaQuery.of(context).size.width * 0.042,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       child: Text(
//                         "Details",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: MediaQuery.of(context).size.width * 0.042,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child: Text(
//                       "Voucher",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: MediaQuery.of(context).size.width * 0.042,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       "Debit",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: MediaQuery.of(context).size.width * 0.042,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       "Credit",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: MediaQuery.of(context).size.width * 0.042,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ...pdfdetails1.map(
//               (e) => Container(
//                 alignment: Alignment.center,
//                 height: SizeConfig.screenHeight * 0.04,
//                 width: SizeConfig.screenWidth,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       flex: 3,
//                       child: Text(
//                         e["date"],
//                         style: TextStyle(
//                           color: Colors.black,
//                             fontSize: MediaQuery.of(context).size.width * 0.037,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Text(
//                         e["type"],
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: MediaQuery.of(context).size.width * 0.037,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 3,
//                       child: Text(
//                         e["voucher"],
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: MediaQuery.of(context).size.width * 0.037,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 2,
//                       child: Text(
//                         e["debit"],
//                         style: TextStyle(
//                             fontSize: MediaQuery.of(context).size.width * 0.037,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.red),
//                       ),
//                     ),
//                     Expanded(
//                         flex: 2,
//                         child: Text(
//                           e["credit"],
//                           style: TextStyle(
//                               fontSize:
//                                   MediaQuery.of(context).size.width * 0.037,
//                               color: Colors.green),
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             Divider(
//               thickness: SizeConfig.screenWidth * 0.00456,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   width: SizeConfig.screenWidth * 0.2,
//                 ),
//                 Text(
//                   "Closing Balance :",
//                   style: TextStyle(
//                     color: Colors.black,
//                       fontWeight: FontWeight.w700,
//                       fontSize: MediaQuery.of(context).size.width * 0.042),
//                 ),
//                 Text("200000",
//                     style: TextStyle(
//                       color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontSize: MediaQuery.of(context).size.width * 0.037)),
//                 Text("20000",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: MediaQuery.of(context).size.width * 0.037)),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text("00",
//                     style: TextStyle(
//                       color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontSize: MediaQuery.of(context).size.width * 0.037)),
//                 SizedBox(
//                   width: SizeConfig.screenWidth * 0.04,
//                 ),
//                 Text("180000",
//                     style: TextStyle(
//                       color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontSize: MediaQuery.of(context).size.width * 0.037)),
//               ],
//             ),
//             Divider(
//               thickness: SizeConfig.screenWidth * 0.00456,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   width: SizeConfig.screenWidth * 0.38,
//                 ),
//                 Text(
//                   " Balance :",
//                   style: TextStyle(
//                     color: Colors.black,
//                       fontWeight: FontWeight.w700,
//                       fontSize: MediaQuery.of(context).size.width * 0.042),
//                 ),
//                 Text("200000",
//                     style: TextStyle(
//                       color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontSize: MediaQuery.of(context).size.width * 0.037)),
//                 Text("200000",
//                     style: TextStyle(
//                       color: Colors.black,
//                         fontWeight: FontWeight.w700,
//                         fontSize: MediaQuery.of(context).size.width * 0.037)),
//               ],
//             ),
//           ]),
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
import 'package:rentapp22/components/default_button.dart';
import 'package:rentapp22/size_config.dart';

import '../../../Employee/dailyexpenses/expenses_data.dart';
import '../controllers/doctor_controller.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({super.key});

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  final pdf = pw.Document();
  DateTime _selectedDate1 = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day - 1);
  DateTime _selectedDate2 = DateTime.now();
  DoctorController doctorController = Get.put(DoctorController());
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  String? date1;
  String? date2;
  @override
  void initState() {
    super.initState();
    makepdf1();
  }

  makepdf1() {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context1) => pw.Container(
          alignment: pw.Alignment.center,

          // padding: pw.EdgeInsets.all(
          //   MediaQuery.of(context).size.width * 0.025,
          // ),
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width*1.9,
          // color: PdfColors.amber,
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Container(
                  alignment: pw.Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.025,
                  // width: MediaQuery.of(context).size.width*1.9,
                  child: pw.Text(
                    "Ledger",
                    style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                    width: MediaQuery.of(context).size.width),
                pw.Container(
                  alignment: pw.Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.025,
                  // width: MediaQuery.of(context).size.width*1.9,
                  child: pw.Text(
                    "UD Service",
                    style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: pw.FontWeight.bold),
                  ),
                ),
                // pw.SizedBox(
                //     height: MediaQuery.of(context).size.height * 0.003,
                //     width: MediaQuery.of(context).size.width),
                pw.Divider(),
                pw.Container(
                  padding: pw.EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.01,
                      right: MediaQuery.of(context).size.width * 0.01),
                  alignment: pw.Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.135,
                  // width: MediaQuery.of(context).size.width*1.9,
                  child: pw.Column(
                    children: [
                      pw.Text(
                        "SHOPNO. 212 RAJ GALAXY COMPLEX, NR. STUTI HIGH LAND  ",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontWeight: pw.FontWeight.normal),
                      ),
                      pw.SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                          width: MediaQuery.of(context).size.width),
                      pw.Text(
                        " PALANPOR JAKATNAKA GAM, SURAT, GUJARAT:395009.",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontWeight: pw.FontWeight.normal),
                      ),
                      pw.SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                          width: MediaQuery.of(context).size.width),
                      pw.Text(
                        "Contact No. : 7990556886 , Email: mohit.udservices@gmail.com",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Divider(
                        color: PdfColors.black,
                      ),
                      pw.Text(
                        "Surat Imagine Center",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                          width: MediaQuery.of(context).size.width),
                      pw.Text(
                        "SHOPNO. 212 RAJ GALAXY COMPLEX, NR. STUTI HIGH LAND ",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontWeight: pw.FontWeight.normal),
                      ),
                      pw.SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                          width: MediaQuery.of(context).size.width),
                      pw.Text(
                        " PALANPOR JAKATNAKA GAM, SURAT, GUJARAT:395009.",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.028,
                            fontWeight: pw.FontWeight.normal),
                      ),
                      pw.SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                          width: MediaQuery.of(context).size.width),
                      pw.Text(
                        "From 01-01-2022 to 01-01-2023",
                        style: pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: pw.BoxDecoration(color: PdfColors.grey200),
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Expanded(
                        flex: 3,
                        child: pw.Container(
                          color: PdfColors.grey300,
                          child: pw.Text(
                            "Date",
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.042,
                                fontWeight: pw.FontWeight.bold),
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 3,
                        child: pw.Container(
                          child: pw.Text(
                            "Details",
                            style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.042,
                                fontWeight: pw.FontWeight.bold),
                          ),
                        ),
                      ),
                      pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                          "Voucher",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Debit",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          "Credit",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                ...doctorController.Data.map(
                  (e) => pw.Container(
                    alignment: pw.Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.04,
                    // width: MediaQuery.of(context).size.width,
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            e["O_Date"],
                            style: pw.TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ),
                        pw.Expanded(
                          flex: 3,
                          child: pw.Text(
                            e["Payment_Transfer_Name"],
                            style: pw.TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ),
                        pw.Expanded(
                          flex: 4,
                          child: pw.Text(
                            "Invoice - ${e["O_Id"]}",
                            style: pw.TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037,
                                fontWeight: pw.FontWeight.normal),
                          ),
                        ),

                        pw.Expanded(
                          flex: 2,
                          child: (e['Payment_Type'] == 'Pending')
                              ? pw.Text(
                                  e["Amount"],
                                  style: pw.TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.037,
                                      fontWeight: pw.FontWeight.normal),
                                )
                              : pw.Text(
                                  " ",
                                  style: pw.TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.037,
                                      fontWeight: pw.FontWeight.normal),
                                ),
                        ),
                        // pw.Spacer(),
                        // pw.Expanded(flex: 2, child: pw.Text(e["credit"])),

                        pw.Expanded(
                          flex: 2,
                          child: (e['Payment_Type'] == 'Receiving')
                              ? pw.Text(
                                  e["Amount"],
                                  style: pw.TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.037,
                                      fontWeight: pw.FontWeight.normal),
                                )
                              : pw.Text(
                                  " ",
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Divider(
                  thickness: 2,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    pw.Text(
                      "Closing Balance :",
                      style: pw.TextStyle(
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.042),
                    ),
                    pw.SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    // pw.Text("200000",
                    //     style: pw.TextStyle(
                    //         color: PdfColors.black,
                    //         fontWeight: pw.FontWeight.bold,
                    //         fontSize:
                    //             MediaQuery.of(context).size.width * 0.037)),
                    pw.Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: pw.Text("${doctorController.debit}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037)),
                    ),
                    pw.Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: pw.Text("${doctorController.credit}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037)),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.SizedBox(
                      width: MediaQuery.of(context).size.width * 0.74,
                    ),
                    pw.Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: pw.Text(
                          "${(doctorController.credit.value + doctorController.debit.value) - doctorController.credit.value}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037)),
                    ),
                    pw.SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    pw.Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: pw.Text(
                          "${(doctorController.credit.value + doctorController.debit.value) - doctorController.credit.value}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037)),
                    ),
                  ],
                ),
                pw.Divider(
                  thickness: 2,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    pw.Text(
                      "Closing Balance :",
                      style: pw.TextStyle(
                          color: PdfColors.black,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.042),
                    ),
                    pw.SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    pw.Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: pw.Text(
                          "${doctorController.credit.value + doctorController.debit.value}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037)),
                    ),
                    pw.Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: pw.Text(
                          "${doctorController.credit.value + doctorController.debit.value}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037)),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "Ledger",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      // ),
      body: Container(
        height: height,
        width: width,
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
              margin: EdgeInsets.all(getProportionateScreenHeight(12)),
              height: SizeConfig.screenHeight * 0.08,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(15))),
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
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(13.5),
                            color: Colors.black,
                          ),
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
                              initialDate: DateTime.now(),
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
                                        offset:
                                            _textEditingController1.text.length,
                                        affinity: TextAffinity.upstream));
                              print(_selectedDate2);
                              doctorController.getApiData(k: {
                                "Id": '${doctorController.id}',
                                "Date1":
                                    "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                                "Date2":
                                    "${DateFormat('yyyy-MM-dd').format(_selectedDate2)}"
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
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(13.5),
                            color: Colors.black,
                          ),
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
                              initialDate: DateTime.now(),
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
                                        offset:
                                            _textEditingController2.text.length,
                                        affinity: TextAffinity.upstream));

                              print(_selectedDate2);
                              doctorController.getApiData(k: {
                                "Id": '${doctorController.id}',
                                "Date1":
                                    "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                                "Date2":
                                    "${DateFormat('yyyy-MM-dd').format(_selectedDate2)}"
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
            Container(
              height: height * 0.08,
              width: width,
              decoration: BoxDecoration(color: Colors.blue.shade300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_alt,
                          size: MediaQuery.of(context).size.width * 0.093,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Duration",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.037,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  "9 jun 2022 - Today",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.0325,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Uint8List data = await pdf.save();
                            await Printing.layoutPdf(
                                onLayout: (format) => data);
                          },
                          child: Icon(
                            Icons.picture_as_pdf,
                            size: MediaQuery.of(context).size.width * 0.081,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              height: height * 0.05,
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
                    flex: 2,
                    child: Container(
                      child: Text(
                        "Details",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.042,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Voucher",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Debit",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.042,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Credit",
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
              future: doctorController.getApiData(k: {
                "Id": '${doctorController.id}',
                "Date1": "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                "Date2": "${DateFormat('yyyy-MM-dd').format(_selectedDate2)}"
              }),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  return Obx(
                    () => (doctorController.Data.isEmpty)
                        ? Center(
                            child: Image.asset("assets/images/no-data.png"))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: doctorController.Data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                height: height * 0.04,
                                width: width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        doctorController.Data[index]["O_Date"],
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
                                        doctorController.Data[index]
                                            ["Payment_Transfer_Name"],
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
                                      flex: 3,
                                      child: Text(
                                        "Invoice-${doctorController.Data[index]["O_Id"]}",
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
                                      child: (doctorController.Data[index]
                                                  ['Payment_Type'] ==
                                              'Pending')
                                          ? Text(
                                              doctorController.Data[index]
                                                  ["Amount"],
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.037,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red),
                                            )
                                          : Text(
                                              " ",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.037,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red),
                                            ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: (doctorController.Data[index]
                                                  ['Payment_Type'] ==
                                              'Receiving')
                                          ? Text(
                                              doctorController.Data[index]
                                                  ["Amount"],
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.037,
                                                  color: Colors.green),
                                            )
                                          : Text(
                                              " ",
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.037,
                                                  color: Colors.green),
                                            ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            Divider(
              thickness: width * 0.00456,
            ),
            Obx(
              () {
                doctorController.credit.value = 0;
                doctorController.debit.value = 0;
                for (int i = 0; i < doctorController.Data.length; i++) {
                  doctorController.getAmount(
                      k: int.parse(doctorController.Data[i]["Amount"]),
                      py: doctorController.Data[i]["Payment_Type"]);
                }
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${doctorController.debit}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037)),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Text(
                          "${doctorController.credit}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width * 0.2,
                        ),
                        Text(
                          "Closing Balance :",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042),
                        ),
                        Text(
                            "${(doctorController.credit.value + doctorController.debit.value) - doctorController.debit.value}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037)),
                        Text(
                            "${(doctorController.credit.value + doctorController.debit.value) - doctorController.credit.value}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.037)),
                      ],
                    ),
                    Divider(
                      thickness: width * 0.00456,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width * 0.38,
                        ),
                        Text(
                          "Balance :",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042),
                        ),
                        Text(
                          "${doctorController.credit.value + doctorController.debit.value}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Text(
                          "${doctorController.credit.value + doctorController.debit.value}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.037),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
