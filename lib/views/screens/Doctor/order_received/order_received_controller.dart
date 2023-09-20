import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderReceivedController extends GetxController {
  RxList data = [].obs;

  getDataApi({required Map k}) async {
    String api = "https://udservice.shop/Api/get_oder_recive_data_api.php";

    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'

    };
    http.Response response =
        await http.post(Uri.parse(api), headers: h, body: k);

    if (response.statusCode == 200) {
      var d = jsonDecode(response.body);
      print(d);
      data.value = d;
      return d;
    }
  }

  DeleteOrder({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse(
            "https://udservice.shop/Api/delete_order_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
    }
  }
  

  setConfirm({required Map k}) async{

    String api = "http://udservice.shop/Api/add_confirm_doctor_order_api.php";

    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response =
        await http.post(Uri.parse(api), headers: h, body: k);

    if (response.statusCode == 200) {
      var d = jsonDecode(response.body);
      print(d);
    }
    
  }
}
