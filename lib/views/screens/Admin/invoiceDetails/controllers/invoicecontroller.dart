import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InvoiceController extends GetxController {
  RxList PartyData = [].obs;
  

  getData({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/get_invoice_report_api.php"),
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
  
}
