import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:rentapp22/size_config.dart';

import 'controllers/inventory_controller.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  static String routeName = '/inventory';

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  InvoiceControllerAll invoiceControllerAll = Get.put(InvoiceControllerAll());


   makePdf({var pdf, required Map data}) {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context1) => pw.Container(
          padding: pw.EdgeInsets.all(4),
          height: SizeConfig.screenHeight,
          width: 500,
          color: PdfColors.white,
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Container(
                  height: SizeConfig.screenHeight * 0.071,
                  width: double.infinity,
                  decoration: pw.BoxDecoration(
                      border: pw.Border(
                          left: pw.BorderSide(width: 1),
                          right: pw.BorderSide(width: 1),
                          top: pw.BorderSide(width: 1))),
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "UD Health Care",
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text(
                          "Shop no.G5,Rajhans Stadium Plaza near New L.P Savani School,",
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.normal),
                        ),
                        pw.Text(
                          "PALANPORE, Gujarat, 395009, Mo.9016630704.",
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.normal),
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                        pw.Text(
                          "GSTIN : 24AARHM0921M1ZY",
                          style: pw.TextStyle(
                              fontSize: 12, fontWeight: pw.FontWeight.normal),
                        ),
                      ]),
                ),
                pw.Container(
                  height: SizeConfig.screenHeight * 0.0205,
                  width: double.infinity,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(width: 1),
                    color: PdfColors.blue200,
                  ),
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          "TAX INVOICE",
                          style: pw.TextStyle(
                              fontSize: 14, fontWeight: pw.FontWeight.bold),
                        ),
                      ]),
                ),
                pw.Container(
                  width: double.infinity,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.087,
                          width: SizeConfig.screenWidth * 0.49,
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                            left: pw.BorderSide(width: 1),
                          )),
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Reverse Charge",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "No",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Invoice No.",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 33,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "${data['O_Id']}",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Invoice Date",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 24,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "${data['O_Date']}",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "State",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 71,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "Gujarat",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "State Code",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 33,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "24",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      pw.Expanded(
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.087,
                          width: SizeConfig.screenWidth * 0.49,
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  left: pw.BorderSide(width: 1),
                                  right: pw.BorderSide(width: 1))),
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Challan No.",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 25,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    " ",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Vehicle No.",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 26,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Date of Supply",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 6,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "${data['O_Date']}",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Place of Supply",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    ":",
                                    style: pw.TextStyle(fontSize: 12),
                                  ),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  height: SizeConfig.screenHeight * 0.02,
                  width: double.infinity,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.blue200,
                  ),
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Row(
                        children: [
                          pw.Expanded(
                            child: pw.Container(
                              alignment: pw.Alignment.center,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border(
                                      left: pw.BorderSide(width: 1),
                                      bottom: pw.BorderSide(width: 1),
                                      top: pw.BorderSide(width: 1))),
                              height: SizeConfig.screenHeight * 0.02,
                              width: SizeConfig.screenWidth * 0.49,
                              child: pw.Text(
                                "Details of Receiver | Billed to:",
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            child: pw.Container(
                              alignment: pw.Alignment.center,
                              decoration: pw.BoxDecoration(
                                  border: pw.Border(
                                      left: pw.BorderSide(width: 1),
                                      bottom: pw.BorderSide(width: 1),
                                      right: pw.BorderSide(width: 1),
                                      top: pw.BorderSide(width: 1))),
                              height: SizeConfig.screenHeight * 0.02,
                              width: SizeConfig.screenWidth * 0.49,
                              child: pw.Text(
                                "Details of Consignee | Shipped to:",
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.12,
                        width: SizeConfig.screenWidth * 0.49,
                        decoration: pw.BoxDecoration(
                            color: PdfColors.white,
                            border: pw.Border(
                              left: pw.BorderSide(width: 1),
                            )),
                        padding: pw.EdgeInsets.all(3),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Name",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 18,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "${data['Hospital_Name']}",
                                  style: pw.TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Address",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "${data['Address']}",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                // Text(""),
                              ],
                            ),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Mobile",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 11,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "${data['Phone_Number']}",
                                  style: pw.TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            pw.Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "State",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 21,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "Gujarat",
                                  style: pw.TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.12,
                        width: SizeConfig.screenWidth * 0.49,
                        decoration: pw.BoxDecoration(
                            color: PdfColors.white,
                            border: pw.Border(
                                left: pw.BorderSide(width: 1),
                                right: pw.BorderSide(width: 1))),
                        padding: pw.EdgeInsets.all(3),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Name",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 18,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "${data['Hospital_Name']}",
                                  style: pw.TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Address",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "${data['Address']}",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                // Text(""),
                              ],
                            ),
                            pw.Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Mobile",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 11,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "${data['Phone_Number']}",
                                  style: pw.TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            pw.Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "State",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 21,
                                ),
                                pw.Text(
                                  ":",
                                  style: pw.TextStyle(fontSize: 12),
                                ),
                                pw.SizedBox(
                                  width: 2,
                                ),
                                pw.Text(
                                  "Gujarat",
                                  style: pw.TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.Container(
                  height: SizeConfig.screenHeight * 0.05,
                  width: double.infinity,
                  color: PdfColors.blue200,
                  child: pw.Row(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.047,
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black)),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Sr.",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                                pw.Text(
                                  "No.",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ]),
                        ),
                      ),
                      pw.Expanded(
                        flex: 5,
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.22,
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  top: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  bottom: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  right: pw.BorderSide(
                                      width: 1, color: PdfColors.black))),
                          alignment: pw.Alignment.center,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Name Of Product",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ]),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.05,
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  top: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  bottom: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  right: pw.BorderSide(
                                      width: 1, color: PdfColors.black))),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Qty",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ]),
                        ),
                      ),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.06,
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  top: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  bottom: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  right: pw.BorderSide(
                                      width: 1, color: PdfColors.black))),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Unit",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ]),
                        ),
                      ),
                      pw.Expanded(
                        flex: 3,
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.06,
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                              top: pw.BorderSide(
                                  width: 1, color: PdfColors.black),
                              bottom: pw.BorderSide(
                                  width: 1, color: PdfColors.black),
                              right: pw.BorderSide(
                                  width: 1, color: PdfColors.black),
                              // left: pw.BorderSide(
                              //     width: 1, color: PdfColors.black),
                            ),
                          ),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Rate",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ]),
                        ),
                      ),
                      pw.Expanded(
                        flex: 3,
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.1,
                          decoration: pw.BoxDecoration(
                            color: PdfColors.blue200,
                            border: pw.Border(
                              top: pw.BorderSide(
                                  width: 1, color: PdfColors.black),
                              bottom: pw.BorderSide(
                                  width: 1, color: PdfColors.black),
                              right: pw.BorderSide(
                                  width: 1, color: PdfColors.black),
                            ),
                          ),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Taxable",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                                pw.Text(
                                  "Value",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ]),
                        ),
                      ),
                      // pw.Expanded(

                      //   child:
                      pw.Container(
                        height: SizeConfig.screenHeight * 0.05,
                        width: SizeConfig.screenWidth * 0.18,
                        color: PdfColors.blue200,
                        child: pw.Column(children: [
                          pw.Container(
                            height: SizeConfig.screenHeight * 0.025,
                            width: SizeConfig.screenWidth * 0.18,
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                              "CGST",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 10),
                            ),
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                          ),
                          pw.Row(
                            children: [
                              pw.Container(
                                height: SizeConfig.screenHeight * 0.025,
                                width: SizeConfig.screenWidth * 0.08,
                                alignment: pw.Alignment.center,
                                child: pw.Text(
                                  "Rate",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                                decoration: pw.BoxDecoration(
                                    border: pw.Border(
                                        bottom: pw.BorderSide(width: 1),
                                        left: pw.BorderSide(width: 1),
                                        right: pw.BorderSide(width: 1))),
                              ),
                              pw.Container(
                                height: SizeConfig.screenHeight * 0.025,
                                width: SizeConfig.screenWidth * 0.10,
                                alignment: pw.Alignment.center,
                                child: pw.Text(
                                  "Amount",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 9),
                                ),
                                decoration: pw.BoxDecoration(
                                    border: pw.Border(
                                  bottom: pw.BorderSide(width: 1),
                                  right: pw.BorderSide(width: 1),
                                )),
                              ),
                            ],
                          )
                        ]),
                      ),
                      // ),
                      // pw.Expanded(

                      // child:
                      pw.Container(
                        height: SizeConfig.screenHeight * 0.05,
                        width: SizeConfig.screenWidth * 0.18,
                        color: PdfColors.blue200,
                        child: pw.Column(children: [
                          pw.Container(
                            height: SizeConfig.screenHeight * 0.025,
                            width: SizeConfig.screenWidth * 0.18,
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                              "CGST",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 10),
                            ),
                            decoration: pw.BoxDecoration(
                                border: pw.Border(
                                    bottom: pw.BorderSide(width: 1),
                                    top: pw.BorderSide(width: 1),
                                    right: pw.BorderSide(width: 1))),
                          ),
                          pw.Row(
                            children: [
                              pw.Container(
                                height: SizeConfig.screenHeight * 0.025,
                                width: SizeConfig.screenWidth * 0.08,
                                alignment: pw.Alignment.center,
                                child: pw.Text(
                                  "Rate",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                                decoration: pw.BoxDecoration(
                                    border: pw.Border(
                                        bottom: pw.BorderSide(width: 1),
                                        // left: BorderSide(width: 1),
                                        right: pw.BorderSide(width: 1))),
                              ),
                              pw.Container(
                                height: SizeConfig.screenHeight * 0.025,
                                width: SizeConfig.screenWidth * 0.10,
                                alignment: pw.Alignment.center,
                                child: pw.Text(
                                  "Amount",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 9),
                                ),
                                decoration: pw.BoxDecoration(
                                    border: pw.Border(
                                        bottom: pw.BorderSide(width: 1),
                                        right: pw.BorderSide(width: 1))),
                              ),
                            ],
                          )
                        ]),
                      ),
                      // ),
                      pw.Expanded(
                        flex: 3,
                        child: pw.Container(
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.084,
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  top: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  bottom: pw.BorderSide(
                                      width: 1, color: PdfColors.black),
                                  right: pw.BorderSide(
                                      width: 1, color: PdfColors.black))),
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Total",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  height: SizeConfig.screenHeight * 0.18,
                  width: double.infinity,
                  color: PdfColors.white,
                  child: pw.Row(children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.047,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                left: pw.BorderSide(width: 1),
                                right: pw.BorderSide(width: 1),
                                bottom: pw.BorderSide(width: 1))),
                        child: pw.Column(children: [
                          pw.Text(
                            "1",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.normal),
                          ),
                          pw.SizedBox(
                            height: 2,
                          ),
                        ]),
                      ),
                    ),
                    pw.Expanded(
                      flex: 5,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.22,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // top: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "${data['Printer_Name']}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 10),
                              ),
                              pw.SizedBox(
                                height: 2,
                              ),
                            ]),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.05,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // top: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "${data['Paper_Quty']}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 10),
                              ),
                              pw.SizedBox(
                                height: 2,
                              ),
                            ]),
                      ),
                    ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.06,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // top: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                " ",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ]),
                      ),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.06,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // top: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "${data['Amount']}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 10),
                              ),
                              pw.SizedBox(
                                height: 2,
                              ),
                            ]),
                      ),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.1,
                        decoration: pw.BoxDecoration(
                            color: PdfColors.blue200,
                            border: pw.Border(
                              // top: BorderSide(width: 1, color: Colors.black),
                              bottom: pw.BorderSide(
                                  width: 1, color: PdfColors.black),
                            )),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "${data['Amount']}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 10),
                              ),
                              // Divider(color: Colors.black,thickness: 1,),
                              pw.SizedBox(
                                height: 2,
                              ),
                            ]),
                      ),
                    ),
                    pw.Container(
                      height: SizeConfig.screenHeight * 0.18,
                      width: SizeConfig.screenWidth * 0.08,
                      alignment: pw.Alignment.center,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "${data['GST']}",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.normal, fontSize: 10),
                          ),
                          pw.SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                      decoration: pw.BoxDecoration(
                          border: pw.Border(
                              bottom: pw.BorderSide(width: 1),
                              left: pw.BorderSide(width: 1),
                              right: pw.BorderSide(width: 1))),
                    ),
                    pw.Container(
                      height: SizeConfig.screenHeight * 0.18,
                      width: SizeConfig.screenWidth * 0.10,
                      alignment: pw.Alignment.center,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "${int.parse(data['Amount']) * (int.parse(data['GST']) / 100)}",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.normal, fontSize: 10),
                          ),
                          pw.SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                      decoration: pw.BoxDecoration(
                          border: pw.Border(
                              bottom: pw.BorderSide(width: 1),
                              right: pw.BorderSide(width: 1))),
                    ),
                    pw.Container(
                      height: SizeConfig.screenHeight * 0.18,
                      width: SizeConfig.screenWidth * 0.08,
                      alignment: pw.Alignment.center,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "${data['GST']}",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.normal, fontSize: 10),
                          ),
                          pw.SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                      decoration: pw.BoxDecoration(
                          border: pw.Border(
                              bottom: pw.BorderSide(width: 1),
                              // left: BorderSide(width: 1),
                              right: pw.BorderSide(width: 1))),
                    ),
                    pw.Container(
                      height: SizeConfig.screenHeight * 0.18,
                      width: SizeConfig.screenWidth * 0.10,
                      alignment: pw.Alignment.center,
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "${int.parse(data['Amount']) * (int.parse(data['GST']) / 100)}",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.normal, fontSize: 10),
                          ),
                          pw.SizedBox(
                            height: 2,
                          ),
                        ],
                      ),
                      decoration: pw.BoxDecoration(
                          border: pw.Border(
                              bottom: pw.BorderSide(width: 1),
                              right: pw.BorderSide(width: 1))),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.18,
                        width: SizeConfig.screenWidth * 0.084,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // top: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "${int.parse(data['Amount']) + (int.parse(data['Amount']) * (int.parse(data['GST']) / 100)) + (int.parse(data['Amount']) * (int.parse(data['GST']) / 100))}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.normal,
                                    fontSize: 10),
                              ),
                              pw.SizedBox(
                                height: 2,
                              ),
                            ]),
                      ),
                    ),
                  ]),
                ),
                pw.Container(
                  height: SizeConfig.screenHeight * 0.02,
                  width: double.infinity,
                  color: PdfColors.blue200,
                  child: pw.Row(children: [
                    pw.Expanded(
                      flex: 6,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.02,
                        width: SizeConfig.screenWidth * 0.267,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                left: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                "Total Quantity",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 9),
                              ),
                            ]),
                      ),
                    ),
                    pw.Expanded(
                      flex: 7,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.02,
                        width: SizeConfig.screenWidth * 0.17,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // left: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                "${data['Paper_Quty']}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 9),
                              ),
                            ]),
                      ),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.02,
                        width: SizeConfig.screenWidth * 0.1,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // left: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                "${data['Amount']}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 9),
                              ),
                            ]),
                      ),
                    ),
                    pw.Container(
                      height: SizeConfig.screenHeight * 0.035,
                      width: SizeConfig.screenWidth * 0.18,
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "${int.parse(data['Amount']) * (int.parse(data['GST']) / 100)}",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 9),
                      ),
                      decoration: pw.BoxDecoration(
                          border: pw.Border(
                              bottom: pw.BorderSide(width: 1),
                              // top: BorderSide(width: 1),
                              right: pw.BorderSide(width: 1))),
                    ),
                    pw.Container(
                      height: SizeConfig.screenHeight * 0.035,
                      width: SizeConfig.screenWidth * 0.18,
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "${int.parse(data['Amount']) * (int.parse(data['GST']) / 100)}",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 9),
                      ),
                      decoration: pw.BoxDecoration(
                          border: pw.Border(
                              bottom: pw.BorderSide(width: 1),
                              // top: BorderSide(width: 1),
                              right: pw.BorderSide(width: 1))),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.07,
                        width: SizeConfig.screenWidth * 0.084,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                // top: BorderSide(width: 1, color: Colors.black),
                                bottom: pw.BorderSide(
                                    width: 1, color: PdfColors.black),
                                right: pw.BorderSide(
                                    width: 1, color: PdfColors.black))),
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                "${int.parse(data['Amount']) + (int.parse(data['Amount']) * (int.parse(data['GST']) / 100)) + (int.parse(data['Amount']) * (int.parse(data['GST']) / 100))}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 9),
                              ),
                            ]),
                      ),
                    ),
                  ]),
                ),
                pw.Container(
                  height: SizeConfig.screenHeight * 0.3,
                  width: double.infinity,
                  color: PdfColors.white,
                  child: pw.Row(children: [
                    // pw.Expanded(
                    //   flex: 3,
                    //   child:
                    pw.Container(
                      height: SizeConfig.screenHeight * 0.3,
                      width: SizeConfig.screenWidth * 0.6,
                      // color: PdfColors.blue,
                      child: pw.Column(children: [
                        pw.Expanded(
                          child: pw.Container(
                            height: SizeConfig.screenHeight * 0.058,
                            width: SizeConfig.screenWidth * 0.58,
                            decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  left: pw.BorderSide(width: 1),
                                  right: pw.BorderSide(width: 1)),
                              color: PdfColors.white,
                            ),
                            padding: pw.EdgeInsets.all(3),
                            child: pw.Column(children: [
                              pw.Text(
                                "Total Invoice Amount in words",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(
                                height: 3,
                              ),
                              pw.Text(
                                "Twelve Thousands Five Hundred Seventy Six Rupees Only/-",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ]),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Container(
                            height: SizeConfig.screenHeight * 0.088,
                            width: SizeConfig.screenWidth * 0.58,
                            decoration: pw.BoxDecoration(
                                border: pw.Border(
                                    top: pw.BorderSide(width: 1),
                                    bottom: pw.BorderSide(width: 1),
                                    left: pw.BorderSide(width: 1),
                                    right: pw.BorderSide(width: 1)),
                                color: PdfColors.white),
                            padding: pw.EdgeInsets.only(left: 3),
                            child: pw.Column(children: [
                              pw.SizedBox(
                                height: 3,
                              ),
                              pw.Text(
                                "Bank Details",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(
                                height: 3,
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text("Bank Account Name",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.SizedBox(
                                    width: 15,
                                  ),
                                  pw.Text(":",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text("UD Healthcare",
                                      style: pw.TextStyle(
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Bank Account Number",
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.normal),
                                  ),
                                  pw.SizedBox(
                                    width: 3,
                                  ),
                                  pw.Text(":",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "50200057158370",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text("Bank IFSC code",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.SizedBox(
                                    width: 42,
                                  ),
                                  pw.Text(":",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text("HDFC0001701",
                                      style: pw.TextStyle(
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "Bank Branch Name",
                                    style: pw.TextStyle(
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.normal),
                                  ),
                                  pw.SizedBox(
                                    width: 23,
                                  ),
                                  pw.Text(":",
                                      style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.normal)),
                                  pw.SizedBox(
                                    width: 2,
                                  ),
                                  pw.Text(
                                    "L P Savani",
                                    style: pw.TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ]),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Container(
                            height: SizeConfig.screenHeight * 0.088,
                            width: SizeConfig.screenWidth * 0.58,
                            decoration: pw.BoxDecoration(
                                border: pw.Border(
                                    bottom: pw.BorderSide(width: 1),
                                    left: pw.BorderSide(width: 1),
                                    right: pw.BorderSide(width: 1)),
                                color: PdfColors.white),
                            padding: pw.EdgeInsets.only(left: 3),
                            child: pw.Column(children: [
                              pw.SizedBox(
                                height: 3,
                              ),
                              pw.Text(
                                "Terms And Condition",
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(
                                height: 3,
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                      "1. This is an electronically generated document.",
                                      style: pw.TextStyle(
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                              pw.Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "2. All disputes are subject to PALANPORE \n    jurisdiction",
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Container(
                            height: SizeConfig.screenHeight * 0.066,
                            width: SizeConfig.screenWidth * 0.58,
                            decoration: pw.BoxDecoration(
                                border: pw.Border(
                                    bottom: pw.BorderSide(width: 1),
                                    left: pw.BorderSide(width: 1),
                                    right: pw.BorderSide(width: 1)),
                                color: PdfColors.white),
                            padding: pw.EdgeInsets.only(left: 3),
                            child: pw.Column(children: []),
                          ),
                        ),
                      ]),
                    ),
                    // ),
                    pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                        height: SizeConfig.screenHeight * 0.3,
                        width: SizeConfig.screenWidth * 0.4,
                        // color: PdfColors.black,
                        child: pw.Column(
                          children: [
                            pw.Row(children: [
                              pw.Expanded(
                                flex: 5,
                                child: pw.Container(
                                  height: SizeConfig.screenHeight * 0.15,
                                  width: SizeConfig.screenWidth * 0.21,
                                  // color: PdfColors.blue,
                                  child: pw.Column(
                                    children: [
                                      pw.Expanded(
                                        child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            // padding: EdgeInsets.all(2),
                                            height:
                                                SizeConfig.screenHeight * 0.04,

                                            // color: Colors.red,
                                            decoration: pw.BoxDecoration(
                                                color: PdfColors.blue200,
                                                border: pw.Border(
                                                    bottom:
                                                        pw.BorderSide(width: 1),
                                                    right: pw.BorderSide(
                                                        width: 1))),
                                            width: SizeConfig.screenWidth * 0.6,
                                            child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                pw.Text(
                                                  "Total Amount",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                ),
                                                pw.Text(
                                                  "Before Tax",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            )),
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            // padding: EdgeInsets.all(2),
                                            height:
                                                SizeConfig.screenHeight * 0.035,
                                            // color: Colors.red,
                                            decoration: pw.BoxDecoration(
                                                color: PdfColors.white,
                                                border: pw.Border(
                                                    bottom:
                                                        pw.BorderSide(width: 1),
                                                    right: pw.BorderSide(
                                                        width: 1))),
                                            // width: SizeConfig.screenWidth * 0.21,
                                            child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                pw.Text(
                                                  "Add : CGST",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            )),
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(
                                            alignment: pw.Alignment(0, 0),
                                            // padding: EdgeInsets.all(2),
                                            height:
                                                SizeConfig.screenHeight * 0.035,
                                            // color: Colors.red,
                                            decoration: pw.BoxDecoration(
                                                color: PdfColors.white,
                                                border: pw.Border(
                                                    bottom:
                                                        pw.BorderSide(width: 1),
                                                    right: pw.BorderSide(
                                                        width: 1))),
                                            // width: SizeConfig.screenWidth * 0.21,
                                            child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                pw.Text(
                                                  "Add : SGST",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            )),
                                      ),
                                      pw.Expanded(
                                        child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            // padding: EdgeInsets.all(2),
                                            height:
                                                SizeConfig.screenHeight * 0.04,
                                            // color: Colors.red,
                                            decoration: pw.BoxDecoration(
                                                color: PdfColors.blue200,
                                                border: pw.Border(
                                                    bottom:
                                                        pw.BorderSide(width: 1),
                                                    right: pw.BorderSide(
                                                        width: 1))),
                                            // width: SizeConfig.screenWidth * 0.21,
                                            child: pw.Column(
                                              mainAxisAlignment:
                                                  pw.MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                pw.Text(
                                                  "Tax Amount : GST",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                ),
                                                pw.SizedBox(
                                                  height: 3,
                                                ),
                                                pw.Text(
                                                  "Amount With Tax",
                                                  style: pw.TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // pw.Expanded(
                              //     child:
                              pw.Container(
                                height: SizeConfig.screenHeight * 0.15,
                                width: SizeConfig.screenWidth * 0.19,
                                color: PdfColors.white,
                                child: pw.Column(
                                  children: [
                                    pw.Expanded(
                                      child: pw.Container(
                                          alignment: pw.Alignment.center,
                                          // padding: EdgeInsets.all(2),
                                          height:
                                              SizeConfig.screenHeight * 0.04,
                                          decoration: pw.BoxDecoration(
                                              color: PdfColors.blue200,
                                              border: pw.Border(
                                                  bottom:
                                                      pw.BorderSide(width: 1),
                                                  right:
                                                      pw.BorderSide(width: 1))),
                                          // width: SizeConfig.screenWidth * 0.21,
                                          child: pw.Column(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(
                                                "${int.parse(data['Amount'])}",
                                                style: pw.TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        pw.FontWeight.bold),
                                              )
                                            ],
                                          )),
                                    ),
                                    pw.Expanded(
                                      child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        // padding: EdgeInsets.all(2),
                                        height: SizeConfig.screenHeight * 0.035,
                                        decoration: pw.BoxDecoration(
                                            border: pw.Border(
                                                bottom: pw.BorderSide(width: 1),
                                                right:
                                                    pw.BorderSide(width: 1))),
                                        // width: SizeConfig.screenWidth * 0.21,
                                        child: pw.Column(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              pw.CrossAxisAlignment.start,
                                          children: [
                                            pw.Text(
                                              " ${int.parse(data['Amount']) * (int.parse(data['GST']) / 100)}",
                                              style: pw.TextStyle(
                                                  fontSize: 10,
                                                  fontWeight:
                                                      pw.FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    pw.Expanded(
                                      child: pw.Container(
                                          alignment: pw.Alignment.center,
                                          // padding: EdgeInsets.all(2),
                                          height:
                                              SizeConfig.screenHeight * 0.035,
                                          decoration: pw.BoxDecoration(
                                              border: pw.Border(
                                                  bottom:
                                                      pw.BorderSide(width: 1),
                                                  right:
                                                      pw.BorderSide(width: 1))),
                                          // width: SizeConfig.screenWidth * 0.21,
                                          child: pw.Column(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.center,
                                            // crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              pw.Text(
                                                " ${int.parse(data['Amount']) * (int.parse(data['GST']) / 100)}",
                                                style: pw.TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        pw.FontWeight.bold),
                                              )
                                            ],
                                          )),
                                    ),
                                    pw.Expanded(
                                      child: pw.Container(
                                          alignment: pw.Alignment.center,
                                          // padding: EdgeInsets.all(2),
                                          height:
                                              SizeConfig.screenHeight * 0.04,
                                          decoration: pw.BoxDecoration(
                                              color: PdfColors.blue200,
                                              border: pw.Border(
                                                  bottom:
                                                      pw.BorderSide(width: 1),
                                                  right:
                                                      pw.BorderSide(width: 1))),
                                          // width: SizeConfig.screenWidth * 0.21,
                                          child: pw.Column(
                                            mainAxisAlignment:
                                                pw.MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                pw.CrossAxisAlignment.start,
                                            children: [
                                              pw.Text(
                                                "₹ ${int.parse(data['Amount']) * (int.parse(data['GST']) / 100) + int.parse(data['Amount']) * (int.parse(data['GST']) / 100)}",
                                                style: pw.TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        pw.FontWeight.bold),
                                              ),
                                              pw.SizedBox(
                                                height: 3,
                                              ),
                                              pw.Text(
                                                " ${int.parse(data['Amount']) + (int.parse(data['Amount']) * (int.parse(data['GST']) / 100)) + (int.parse(data['Amount']) * (int.parse(data['GST']) / 100))}",
                                                style: pw.TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        pw.FontWeight.bold),
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              )
                              // ),
                            ]),
                            // pw.Expanded(child:

                            pw.Container(
                              height: SizeConfig.screenHeight * 0.15,
                              width: SizeConfig.screenWidth * 0.8,
                              padding: pw.EdgeInsets.only(top: 3),
                              decoration: pw.BoxDecoration(
                                  color: PdfColors.white,
                                  border: pw.Border(
                                      right: pw.BorderSide(width: 1),
                                      bottom: pw.BorderSide(width: 1))),
                              child: pw.Column(children: [
                                pw.Text(
                                  "Certified that the particular given",
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                                pw.Text(
                                  " above are true and correct",
                                  style: pw.TextStyle(fontSize: 10),
                                ),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Text(
                                  "For, UD HEALTH CARE",
                                  style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.Container(
                                  height: SizeConfig.screenHeight * 0.07,
                                  width: SizeConfig.screenWidth * 0.4,
                                  color: PdfColors.white,
                                ),
                                pw.Text(
                                  "Authorised Signatory",
                                  style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                              ]),
                            )
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                )
              ]),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(10),
            left: getProportionateScreenHeight(13),
            right: getProportionateScreenHeight(13)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Invoice",
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(24),
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                flex: 10,
                child: FutureBuilder(
                  future: invoiceControllerAll.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return Obx(
                        () => (invoiceControllerAll.DataAll.isEmpty)
                            ? Center(
                                child: Image.asset("assets/images/no-data.png"),
                              )
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: invoiceControllerAll.DataAll.length,
                                itemBuilder: (context, i) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () async{
                                          pw.Document pdf =
                                                        pw.Document();
                                                    await makePdf(
                                                        pdf: pdf,
                                                        data:
                                                            invoiceControllerAll
                                                                .DataAll[i]);
                                                    Uint8List data =
                                                        await pdf.save();
                                                    await Printing.layoutPdf(
                                                        onLayout: (format) =>
                                                            data);
                                        },
                                        child: Container(
                                          height: SizeConfig.screenHeight * 0.24,
                                          width: SizeConfig.screenWidth,
                                          padding: EdgeInsets.all(
                                            getProportionateScreenHeight(12),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              getProportionateScreenHeight(15),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "${invoiceControllerAll.DataAll[i]['Hospital_Name']}",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              19),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                    getProportionateScreenHeight(
                                                        5),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Unit",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize:
                                                              getProportionateScreenHeight(
                                                                  15),
                                                        ),
                                                      ),
                                                      Text(
                                                        "${invoiceControllerAll.DataAll[i]['Unit']}",
                                                        style: TextStyle(
                                                            color: Colors.black),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            getProportionateScreenHeight(
                                                                15),
                                                      ),
                                                      Text(
                                                        "Price",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize:
                                                              getProportionateScreenHeight(
                                                                  15),
                                                        ),
                                                      ),
                                                      Text(
                                                        "${invoiceControllerAll.DataAll[i]['Amount']}rs",
                                                        style: TextStyle(
                                                            color: Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        getProportionateScreenWidth(
                                                            80),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Invoice No",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize:
                                                              getProportionateScreenHeight(
                                                                  15),
                                                        ),
                                                      ),
                                                      Text(
                                                        "${invoiceControllerAll.DataAll[i]['O_Id']}",
                                                        style: TextStyle(
                                                            color: Colors.black),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            getProportionateScreenHeight(
                                                                15),
                                                      ),
                                                      Text(
                                                        "Payment Type",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize:
                                                              getProportionateScreenHeight(
                                                                  15),
                                                        ),
                                                      ),
                                                      Text(
                                                        "${invoiceControllerAll.DataAll[i]['Payment_Type']}",
                                                        style: TextStyle(
                                                            color: Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(color: Colors.black),
                                    ],
                                  );
                                },
                              ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
