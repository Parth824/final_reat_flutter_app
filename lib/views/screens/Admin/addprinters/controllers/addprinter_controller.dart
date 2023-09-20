import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddItemController extends GetxController {
  RxList addItemlist = [].obs;

  getData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_product_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      addItemlist.value = data;
      return data;
    }
  }

  DeleteData({required Map data}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/delete_product_api.php"),
        headers: h,
        body: data);

    if (response.statusCode == 200) {
      var k = jsonDecode(response.body);
      if (k['result'] == "Delete successfuly") {
        return 1;
      } else {
        return 0;
      }
    }
  }

  UpdateData({required Map data}) async{
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('Parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/update_product_api.php"),
        headers: h,
        body: data);
    print('Parth');
    if (response.statusCode == 200) {
      var data1 = await jsonDecode(response.body);
      print(data1);
      if (data1['result'] == "insertion successfuly") {
        return 1;
      } else {
        return 0;
      }
    }
    return 0;
  }

  Future<int> InsertData({required Map data}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('Parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/add_get_product_api.php"),
        headers: h,
        body: data);
    print('Parth');
    if (response.statusCode == 200) {
      var data1 = await jsonDecode(response.body);
      print(data1);
      if (data1['result'] == "insertion successfuly") {
        return 1;
      } else {
        return 0;
      }
    }
    return 0;
  }
}
