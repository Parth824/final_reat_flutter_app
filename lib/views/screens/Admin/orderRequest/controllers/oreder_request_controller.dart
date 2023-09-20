import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class OrderRequestController extends GetxController {
  RxList orderRequest = [].obs;
  RxList listEmpRequest = [].obs;

  getData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_order_table_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      orderRequest.value = data;
      return data;
    }
  }

  choiseEmp({required Map k}) async {
    Map<String, String> h = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    print('parth');
    http.Response response = await http.post(
        Uri.parse(
            "https://udservice.shop/Api/get_update_order_table_emp_api.php"),
        headers: h,
        body: k);
    print('parth');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('parth');
      return data;
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

  getEmpData() async {
    http.Response response = await http.get(
      Uri.parse("https://udservice.shop/Api/add_get_employee_api.php"),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      listEmpRequest.value = data;
      return data;
    }
  }
}



// <?php

//     header("Access-Control-Allow-Methods: POST,GET");
//     header("Content-Type: appilcation/json");

    
//     include('api.php');

//     $api = new Api();

//     if($_SERVER['REQUEST_METHOD'] == 'POST')
//     {
//         $printer_name = $_POST['Printer_Name'];
//         $paper_quty = $_POST['Paper_Quty'];
//         $payment_transfer_Name = $_POST['Payment_Transfer_Name'];
//         $j_id = $_POST['J_Id'] ;
//         $i_id = $_POST['I_Id'];
//         $f_id = $_POST['F_Id'];
//         $payment_type = $_POST['Payment_Type'];
//         $order_received = $_POST['Order_Received'];
//         $d_id = $_POST['D_Id'];
//         $O_Date = $_POST['O_Date'];
//         $Amount = $_POST['Amount'];
//         $agreement = $_POST['Agreement'];
//         $installation = $_POST['Installation'];
//         $Signature = $_FILES['Signature'];
//         $unit = $_POST['Unit'];
//         $gst = $_POST['GST']
            

//             if($Signature['name'] != null)
//             {
//                 $fillename = $Signature['name'];
//             $temp_path = $Signature['tmp_name'];
    
//             $uid = uniqid();
    
//             $image_name = $uid . "-". $fillename;
//             $dec_path = "../Upload/" . $image_name;
    
//             $isfile =  move_uploaded_file($temp_path,$dec_path);
//                 $api->add_order_table_data($printer_name,$paper_quty,$i_id,$j_id,$f_id,$payment_transfer_Name,$payment_type,$order_received,$d_id,$O_Date,$Amount,$agreement,$installation,$image_name,$unit,$gst);
//             }
//             else{
//                 $image_name = "";
//                 $api->add_order_table_data($printer_name,$paper_quty,$i_id,$j_id,$f_id,$payment_transfer_Name,$payment_type,$order_received,$d_id,$O_Date,$Amount,$agreement,$installation,$image_name,$unit,$gst);
//             }

            
//     }
//     else if($_SERVER['REQUEST_METHOD'] == 'GET'){
//         $api->fetch_order_table_data();
//     }
//     else{
//         echo json_encode(['result'=>'This Method Not....']);
//     }

// ?>