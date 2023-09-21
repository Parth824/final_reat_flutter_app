import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmployeeController extends GetxController {
  RxList emplist = [].obs;
  RxList addalldata = [].obs;

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

  getApiData({required Map k}) async {
    String api = "http://udservice.shop/Api/get_attendance_emp_api.php";
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response =
        await http.post(Uri.parse(api), headers: h, body: k);

    if (response.statusCode == 200) {
      var d = jsonDecode(response.body);
      print(d);
         addalldata.value = d;
      return d;
    }
  }

  upadetApiData({required Map k}) async {
    String api = "http://udservice.shop/Api/update_data_p_a.php";
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response =
        await http.post(Uri.parse(api), headers: h, body: k);

    if (response.statusCode == 200) {
      var d = jsonDecode(response.body);
      print(d);
      return d;
    }
  }
}
