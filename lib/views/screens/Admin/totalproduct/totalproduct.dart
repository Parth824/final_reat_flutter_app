import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/totalproduct/all_doctor_data.dart';
import 'package:rentapp22/views/screens/Employee/dailyexpenses/expenses_data.dart';

import '../../../../components/default_button.dart';
import 'controllers/total_product_controllers.dart';

class TotalProduct extends StatefulWidget {
  const TotalProduct({super.key});

  static String routeName = '/productreportsales';
  @override
  State<TotalProduct> createState() => _TotalProductState();
}

class _TotalProductState extends State<TotalProduct> {
   TotalPuodectSalesController totalPuodectSalesController = Get.put(TotalPuodectSalesController());
  DateTime _selectedDate1 = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day - 1);
  DateTime _selectedDate2 = DateTime.now();
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _searchEditingController = TextEditingController();
  String? date1;
  String? date2;
  String? search;
  int i =0;
  int total =0;

   makePDF({var pdf, required List data}) async {
    i = 0;
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
                    pw.Container(
                      width: 150,
                      child: pw.Column(
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
                    ),
                    pw.Container(
                      width:200,
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Product Name',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ),
                    pw.Container(
                      width:200,
                    child: pw.Column(
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
                    ),
                   pw.Container(
                    width: 150,
                      child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Total',
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                              fontSize: 12.0, fontWeight: pw.FontWeight.bold),
                        ),
                      ],
                    ),
                    )
                  ],
                ),
                ...data.map((e) {
                  i = i + 1;
                  total = total + int.parse(e['sum']);
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
                            e['Printer_Name'],
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
                            "${e['sum']}",
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
                          style: pw.TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          "$i",
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            fontSize: 12.0,
                            fontWeight: pw.FontWeight.bold
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
                            fontWeight: pw.FontWeight.bold
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController1
      ..text = DateFormat("yyyy-MM-dd").format(_selectedDate1);
    _textEditingController2
      ..text = DateFormat("yyyy-MM-dd").format(_selectedDate2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
        ],
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
                                await totalPuodectSalesController.getData(k: {
                                  'DATE1':
                                      "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                                  'DATE2':
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
                                await totalPuodectSalesController.getData(k: {
                                  'DATE1':
                                      "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                                  'DATE2':
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
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenHeight(10),
                  right: getProportionateScreenHeight(10),
                ),
                child: Row(
                  children: [
                    Text(
                      "Party Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                    Text(
                      "Amount",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              FutureBuilder(
                future: totalPuodectSalesController.getData(k: {
                  'DATE1': "${DateFormat('yyyy-MM-dd').format(_selectedDate1)}",
                  'DATE2': "${DateFormat('yyyy-MM-dd').format(_selectedDate2)}"
                }),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "${snapshot.error}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return Obx(
                      () => (totalPuodectSalesController.PartyData.isEmpty)
                          ? Center(
                              child: Image.asset(
                                "assets/images/no-data.png",
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalPuodectSalesController.PartyData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenHeight(10)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => allDoctorProudct(),
                                          settings: RouteSettings(arguments: {
                                           
                                           "Name": "${totalPuodectSalesController.PartyData[index]['Printer_Name']}"
                                          }),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: SizeConfig.screenHeight * 0.1,
                                      color: Colors.white,
                                      padding: EdgeInsets.all(
                                          getProportionateScreenHeight(8)),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: SizeConfig.screenWidth * 0.5,
                                            child: Text(
                                              "${totalPuodectSalesController.PartyData[index]['Printer_Name']}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        18),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "₹ ${totalPuodectSalesController.PartyData[index]['sum']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenHeight(
                                                      18),
                                            ),
                                          ),
                                        ],
                                      ),
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
              SizedBox(width: getProportionateScreenWidth(20),),
          Container(
            height: SizeConfig.screenHeight * 0.07,
            width: SizeConfig.screenWidth *0.8,
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
                    data: totalPuodectSalesController.PartyData.value,
                  );
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