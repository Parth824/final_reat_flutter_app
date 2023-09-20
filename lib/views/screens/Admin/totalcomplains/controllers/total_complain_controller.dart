import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ComplainController extends GetxController {
  RxList complainlist = [].obs;
  RxList listEmpComplain = [].obs;

  getData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_complain_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      complainlist.value = data;
    }
  }
  choiseEmp({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse(
            "https://udservice.shop/Api/update_eid_complain_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
    }
  }

  DeleteCompla({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse(
            "https://udservice.shop/Api/delete_complains_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
    }
  }

  getEmpData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_employee_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      listEmpComplain.value = data;
      return data;
    }
  }
}
