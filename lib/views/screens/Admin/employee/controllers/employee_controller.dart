import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmployeeController extends GetxController {
  RxList emplist = [].obs;

  getData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_employee_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      emplist.value = data;
    }
  }
}