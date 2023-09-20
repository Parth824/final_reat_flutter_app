import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BankAccountController extends GetxController {
  RxList accountlist = [].obs;

  getData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_bank_account_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      accountlist.value = data;
    }
  }

  InsertData({required Map k}) async {
    final baseUrl = 'https://udservice.shop/Api/add_get_bank_account_api.php';

    http.MultipartRequest multipartRequest =
    await http.MultipartRequest('POST', Uri.parse(baseUrl));

    multipartRequest.fields['Bank_Name'] = k['bank_name'];
    multipartRequest.fields['Type'] = k['type'];
    multipartRequest.fields['Opening_Price'] = k['opening_price'];
    // multipartRequest.fields['Amount'] = k['amount'];
    // multipartRequest.fields['Ex_Date'] = k['date'];
    // multipartRequest.fields['E_Id'] = k['e_id'];
    // multipartRequest.files.add(http.MultipartFile.fromBytes(
    //     'Bill_Image', k['image'],
    //     filename: k['imagename']));
    http.StreamedResponse res = await multipartRequest.send();
    print('path');

    if (res.statusCode == 200) {
      print('parth1');
    }
  }
}