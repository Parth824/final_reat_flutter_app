import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentapp22/routes.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/theme.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Doctor/homepage/homepage.dart';
import 'package:rentapp22/views/screens/Employee/homepage/homepage.dart';
import 'package:rentapp22/views/screens/LoginScreens/signin/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/notification_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/screens/Admin/homepage/homepage.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await NotificationHelper.notificationHelper.NotificationInitialize();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  late bool k;
  late bool k1;
  late bool k2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    k = sharedPreferences.getBool('isLogin') ?? false;
    k1 = sharedPreferences.getBool('isDoctor') ?? false;
    k2 = sharedPreferences.getBool('isAdmin') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      initialRoute: (k)
          ? (k2)
              ? AdminHomePage.routeName
              : (k1)
                  ? DoctorHomePage.routeName
                  : EmployeeHomePage.routeName
          : SigniInScreen.routeName,
      routes: routes,
    );
  }
}
