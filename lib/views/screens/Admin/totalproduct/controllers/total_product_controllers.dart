import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TotalPuodectSalesController extends GetxController {
  RxList PartyData = [].obs;
  RxList allDoctorData = [].obs;

  getData({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/product_wise_sales_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      PartyData.value = data;
      return data;
    }
  }
  getDataDoctor({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/get_party_report_sales_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      allDoctorData.value = data;
      return data;
    }
  }
}