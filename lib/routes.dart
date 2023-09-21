import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Admin/homepage/homepage.dart';
import 'package:rentapp22/views/screens/Doctor/complain/complain.dart';
import 'package:rentapp22/views/screens/Doctor/homepage/homepage.dart';
import 'package:rentapp22/views/screens/Doctor/ledger/ledger.dart';
import 'package:rentapp22/views/screens/Doctor/order/order_page.dart';
import 'package:rentapp22/views/screens/Doctor/order/payment_order_page.dart';
import 'package:rentapp22/views/screens/Doctor/order/printer_details_screen.dart';
import 'package:rentapp22/views/screens/Doctor/order_received/order_recevied.dart';
import 'package:rentapp22/views/screens/Doctor/payment/payment.dart';
import 'package:rentapp22/views/screens/Doctor/payment_due/payment_due.dart';
import 'package:rentapp22/views/screens/Employee/attendance/attendance.dart';
import 'package:rentapp22/views/screens/Employee/dailyexpenses/daliy_expenses.dart';
import 'package:rentapp22/views/screens/Employee/homepage/homepage.dart';
import 'package:rentapp22/views/screens/Employee/orderdelivery/orderdelivery.dart';
import 'package:rentapp22/views/screens/LoginScreens/complete_profile/complete_profile_screen.dart';
import 'package:rentapp22/views/screens/LoginScreens/forgot_password/forgot_pass_screen.dart';
import 'package:rentapp22/views/screens/LoginScreens/login_success/login_success_screen.dart';
import 'package:rentapp22/views/screens/LoginScreens/otp/otp_screen.dart';
import 'package:rentapp22/views/screens/LoginScreens/select_category/select_category_screen.dart';
import 'package:rentapp22/views/screens/LoginScreens/sign_up/sign_up_screen.dart';
import 'package:rentapp22/views/screens/LoginScreens/signin/sign_in_screen.dart';

import 'views/screens/Admin/invoice/inventory.dart';
import 'views/screens/Admin/orderRequest/listemployye.dart';
import 'views/screens/Admin/totalsales/partyReport.dart';
import 'views/screens/Admin/totalsales/totalsales.dart';

final Map<String, WidgetBuilder> routes = {
  // SplashScreen.routeName: (context) => SplashScreen(),
  SigniInScreen.routeName: (context) => SigniInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  SelectCategory.routeName: (context) => SelectCategory(),
  DoctorHomePage.routeName: (context) => DoctorHomePage(),
  Order_Page.routeName: (context) => Order_Page(),
  PrinterDetails.routeName: (context) => PrinterDetails(),
  PaymentPage.routeName: (context) => PaymentPage(),
  ComplainPage.routeName: (context) => ComplainPage(),
  OrderReceivedPage.routeName: (context) => OrderReceivedPage(),
  LedgerPage.routeName: (context) => LedgerPage(),
  PaymentDuePage.routeName: (context) => PaymentDuePage(),
  AdminHomePage.routeName: (context) => AdminHomePage(),
  EmployeeHomePage.routeName: (context) => EmployeeHomePage(),
  OrderDeliveryPage.routeName: (context) => OrderDeliveryPage(),
  DaliyExpensesPage.routeName: (context) => DaliyExpensesPage(),
  AttendancePage.routeName: (context) => AttendancePage(),
  PaymentOrderPage.routeName: (context) => PaymentOrderPage(),
  SalesReportPage.routeName: (context) => SalesReportPage(),
  InventoryPage.routeName: (context) => InventoryPage(),
  ListEmployye.routeName:(context) => ListEmployye(),
  PartReport.routeName:(context) => PartReport(),
};

class Routes {
  static final routes = [
    GetPage(
      name: SigniInScreen.routeName,
      page: () => SigniInScreen(),
    ),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: LoginSuccessScreen.routeName,
      page: () => LoginSuccessScreen(),
    ),
    GetPage(
      name: SignUpScreen.routeName,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: CompleteProfileScreen.routeName,
      page: () => CompleteProfileScreen(),
    ),
    GetPage(
      name: OtpScreen.routeName,
      page: () => OtpScreen(),
    ),
    GetPage(
      name: SelectCategory.routeName,
      page: () => SelectCategory(),
    ),
    GetPage(
      name: DoctorHomePage.routeName,
      page: () => DoctorHomePage(),
    ),
    GetPage(
      name: Order_Page.routeName,
      page: () => Order_Page(),
    ),
    GetPage(
      name: PrinterDetails.routeName,
      page: () => PrinterDetails(),
    ),
    GetPage(
      name: PaymentPage.routeName,
      page: () => PaymentPage(),
    ),
    GetPage(
      name: ComplainPage.routeName,
      page: () => ComplainPage(),
    ),
    GetPage(
      name: OrderReceivedPage.routeName,
      page: () => OrderReceivedPage(),
    ),
    GetPage(
      name: InventoryPage.routeName,
      page: () => InventoryPage(),
    ),
    GetPage(
      name: LedgerPage.routeName,
      page: () => LedgerPage(),
    ),
    GetPage(
      name: PaymentDuePage.routeName,
      page: () => PaymentDuePage(),
    ),
    GetPage(
      name: AdminHomePage.routeName,
      page: () => AdminHomePage(),
    ),
    GetPage(
      name: EmployeeHomePage.routeName,
      page: () => EmployeeHomePage(),
    ),
    GetPage(
      name: OrderDeliveryPage.routeName,
      page: () => OrderDeliveryPage(),
    ),
    GetPage(
      name: DaliyExpensesPage.routeName,
      page: () => DaliyExpensesPage(),
    ),
    GetPage(
      name: AttendancePage.routeName,
      page: () => AttendancePage(),
    ),
    GetPage(
      name: ListEmployye.routeName,
      page: () => ListEmployye(),
    ),
    GetPage(
      name: PartReport.routeName,
      page: () => PartReport(),
    ),
  ];
}
