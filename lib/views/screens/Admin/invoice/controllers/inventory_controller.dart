import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InvoiceControllerAll extends GetxController {
  RxList DataAll = [].obs;
  

  getData() async {
    
    http.Response response = await http.get(
        Uri.parse("https://udservice.shop/Api/add_get_order_table_api.php"),
        );
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      DataAll.value = data;
      return data;
    }
  }
  
}