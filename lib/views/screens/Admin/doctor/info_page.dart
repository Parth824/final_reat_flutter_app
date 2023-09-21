import 'package:flutter/material.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/doctor/controllers/doctor_controller.dart';
import 'package:get/get.dart';

import '../totalsales/partyReport.dart';
import 'components/information_doctor.dart';
import 'components/prnding_transaction_doctor.dart';
import 'components/Sales.dart';

class Infor_Page extends StatefulWidget {
  const Infor_Page({super.key});

  @override
  State<Infor_Page> createState() => _Infor_PageState();
}

class _Infor_PageState extends State<Infor_Page>
    with SingleTickerProviderStateMixin {
  DoctorController doctorController = Get.find<DoctorController>();

  var arg = Get.arguments;

  late TabController tabController;
  PageController pagecontroller = PageController();
  int currentpage = 0;
  int cupertinoindex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  int initialpage = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          arg['Hospital_Name'],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorWeight: 3,
          indicatorColor: Colors.white,
          onTap: (val) {
            setState(() {
              currentpage = val;
            });
            pagecontroller.animateToPage(val,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          controller: tabController,
          tabs: [
            Tab(
              child: Text("Information"),
            ),
            Tab(
              child: Text("Pending"),
            ),
            Tab(
              child: Text("Sales"),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pagecontroller,
        onPageChanged: (val) {
          setState(() {
            currentpage = val;
          });
          tabController.animateTo(val);
        },
        children: [
          InformationDoctor(),
          PendingTransactionDoctor(),
          SalesReport()
        ],
      ),
    );
  }
}
