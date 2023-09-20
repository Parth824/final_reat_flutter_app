import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DoctorController extends GetxController {
  RxList doctorlist = [].obs;
  RxInt total = 0.obs;
  RxList doctorPanding = [].obs;
  RxString id = "".obs;

  getData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_doctor_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      doctorlist.value = data;
    }
  }

  getPanding({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/get_pending_doctor_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      doctorPanding.value = data;
      return data;
    }
  }

  UpdateSize({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/putsize_doctor_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
    }
  }

  UpdatePaper({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/putprice_doctor_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
    }
  }

  UpdateInk({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/putink_doctor_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
    }
  }

  UpdateFilm({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse("https://udservice.shop/Api/putflims_doctor_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
    }
  }
}
