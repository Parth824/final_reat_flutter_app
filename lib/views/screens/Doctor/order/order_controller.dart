import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  RxList Data = [].obs;
  RxList Data1 = [].obs;
  RxMap orderData = {}.obs;
  RxInt currenIndex = 0.obs;
  RxString type = "".obs;

  setIndex({required int k}) {
    currenIndex.value = k;
  }

  setOrder({required Map k}) async {
    String api = "https://udservice.shop/Api/add_get_order_table_api.php";

    http.MultipartRequest request =
        await http.MultipartRequest("POST", Uri.parse(api));
    print(k);
    request.fields['D_Id'] = k['D_Id'];
    request.fields['Printer_Name'] = k['Printer_Name'];
    request.fields['Paper_Quty'] = k['Paper_Quty'];
    request.fields['Payment_Transfer_Name'] = k['Payment_Transfer_Name'];
    request.fields['J_Id'] = k['J_Id'];
    request.fields['I_Id'] = k['I_Id'];
    request.fields['F_Id'] = k['F_Id'];
    request.fields['Payment_Type'] = k['Payment_Type'];
    request.fields['Order_Received'] = k['Order_Received'];
    request.fields['O_Date'] = k['O_Date'];
    request.fields['Amount'] = k['Amount'];
    request.fields['Agreement'] = k['Agreement'];
    request.fields['Installation'] = k['Installation'];
    request.fields['Unit'] = k['Unit'];
    request.fields['GST'] = k['GST'];

    request.files.add(http.MultipartFile.fromBytes("Signature", k['Signature'],
        filename: k['ImageName']));

    http.StreamedResponse res = await request.send();
    if (res.statusCode == 200) {
      print("om");
    }
  }

  Cod({required Map k}) async {
    String api = "http://udservice.shop/Api/add_get_order_table_api.php";

    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response =
        await http.post(Uri.parse(api), headers: h, body: k);

    if (response.statusCode == 200) {
      var d = jsonDecode(response.body);
      return d;
    }
  }

  getData({required Map k}) async {
    http.Response response = await http
        .get(Uri.parse("https://udservice.shop/Api/add_get_product_api.php"));

    String api = "https://udservice.shop/Api/get_doctor_id_api.php";

    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response1 =
        await http.post(Uri.parse(api), headers: h, body: k);

    if (response.statusCode == 200) {
      var rd = jsonDecode(response.body);
      print(rd);
      Data.value = rd;
    }
    if (response1.statusCode == 200) {
      var rd = jsonDecode(response1.body);
      print(rd);
      Data1.value = rd;
      return rd;
    }
  }
}
