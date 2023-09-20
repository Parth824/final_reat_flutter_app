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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  DoctorController doctorController = Get.find<DoctorController>();

  var arg = Get.arguments;

  DateTime? _selectedDate1;
  DateTime? _selectedDate2;
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _searchEditingController = TextEditingController();
  String? date1;
  String? date2;
  String? search;

  List<Map<String, dynamic>> salesList = [
    {
      'i_no': '1',
      'quantity': '500',
      'date': '01-08-2023',
      'tax_amount': '5000.00',
      'taxes': '0.00',
      'total': '5600.00',
    },
    {
      'i_no': '1',
      'quantity': '500',
      'date': '01-08-2023',
      'tax_amount': '5000.00',
      'taxes': '0.00',
      'total': '5600.00',
    },
    {
      'i_no': '1',
      'quantity': '500',
      'date': '01-08-2023',
      'tax_amount': '5000.00',
      'taxes': '0.00',
      'total': '5600.00',
    },
    {
      'i_no': '1',
      'quantity': '500',
      'date': '01-08-2023',
      'tax_amount': '5000.00',
      'taxes': '0.00',
      'total': '5600.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                                        offset:
                                            _textEditingController1.text.length,
                                        affinity: TextAffinity.upstream));
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
                                        offset:
                                            _textEditingController2.text.length,
                                        affinity: TextAffinity.upstream));
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
              height: SizeConfig.screenHeight * 0.06,
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(12)),
              child: TextFormField(
                controller: _searchEditingController,
                onSaved: (val) {
                  search = val!;
                },
                validator: (val) {},
                onTap: () {},
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(8),
                      horizontal: getProportionateScreenHeight(8)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenHeight * 0.03),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenHeight * 0.03),
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenHeight * 0.03),
                  ),
                  prefixIcon: Icon(Icons.search_rounded),
                  hintText: "Search",
                  hintStyle: TextStyle(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(10),
              ),
              height: SizeConfig.screenHeight * 0.54,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: salesList.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenHeight(12)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.16,
                          width: SizeConfig.screenWidth * 1,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getProportionateScreenHeight(10)),
                                      topRight: Radius.circular(
                                          getProportionateScreenHeight(10)),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Invoice No.",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        15),
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${salesList[i]['i_no']}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        14),
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Quantity",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        15),
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${salesList[i]['quantity']}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        14),
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Invoice Date",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        15),
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${salesList[i]['date']}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        14),
                                                color: Colors.black),
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
                                      getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          getProportionateScreenHeight(10)),
                                      bottomRight: Radius.circular(
                                          getProportionateScreenHeight(10)),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Taxeble Amt.",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        15),
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${salesList[i]['tax_amount']}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        14),
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Taxes",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        15),
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${salesList[i]['taxes']}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        14),
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: SizeConfig.screenWidth * 0.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        15),
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            "${salesList[i]['total']}",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        14),
                                                color: Colors.black),
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
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                      ],
                    ),
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
              child: DefaultButton(text: "Genrate", press: () {}),
            ),
          ],
        ),
      ),
      // child: LayoutBuilder(
      //   builder: (context, constraint) {
      //     return SingleChildScrollView(
      //       child: ConstrainedBox(
      //         constraints: BoxConstraints(minHeight: constraint.maxHeight),
      //         child: IntrinsicHeight(
      //           child: Column(
      //             children: <Widget>[
      //               Text("Header",style: TextStyle(color: Colors.black),),
      //               Expanded(
      //                 child: Container(
      //                   color: Colors.red,
      //                 ),
      //               ),
      //               Text("Footer"),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
