import 'package:flutter/material.dart';
import 'package:rentapp22/constants.dart';
import 'package:rentapp22/size_config.dart';
import 'package:get/get.dart';

import '../controllers/doctor_controller.dart';
import '../doctor.dart';

class InformationDoctor extends StatefulWidget {
  const InformationDoctor({super.key});

  @override
  State<InformationDoctor> createState() => _InformationDoctorState();
}

class _InformationDoctorState extends State<InformationDoctor> {
  DoctorController doctorController = Get.find<DoctorController>();

  TextEditingController size = TextEditingController();
  TextEditingController paper = TextEditingController();
  TextEditingController ink = TextEditingController();
  TextEditingController filem = TextEditingController();

  var arg = Get.arguments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctorController.id.value = arg['D_Id'];
    size.text = arg['Paper_Size'];
    paper.text = arg['Paper_Price'];
    ink.text = arg['Ink_Price'];
    filem.text = arg['Flims_Price'];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.all(SizeConfig.screenWidth * 0.0233),
      // color: Colors.grey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // alignment: Alignment.center,
              // height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.all(SizeConfig.screenWidth * 0.0233),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.screenWidth * 0.0233),
                  color: Colors.blue.shade100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/hospital.png"),
                      ),
                      Text(
                        " ${arg["Hospital_Name"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.screenWidth * 0.042,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/doctor.png"),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.02,
                      ),
                      Text(
                        "${arg["First_Name"]} ${arg["Last_Name"]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.screenWidth * 0.042,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/mobile.png"),
                      ),
                      Text(
                        " ${arg["Phone_Number"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.screenWidth * 0.042,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/location.png"),
                      ),
                      Text(
                        " ${arg["Address"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.screenWidth * 0.042,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/paper.png"),
                      ),
                      Text(
                        " ${arg["Paper_Size"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.screenWidth * 0.037,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: TextFormField(
                                  controller: size,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    hintText: "Paper Size",
                                    hintStyle: TextStyle(),
                                    labelText: "Paper Size",
                                    labelStyle: TextStyle(),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      print(size.text);
                                      var data =
                                          await doctorController.UpdateSize(k: {
                                        'D_Id': "${arg['D_Id']}",
                                        'Paper_Size': size.text
                                      });
                                      if (data['result'] ==
                                          "Updatetion successfuly") {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("SuccessFluuy.."),
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                        await doctorController.getData();
                                        
                                      } else {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Falid.."),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/rupee.png"),
                      ),
                      Text(
                        " ${arg["Paper_Price"]} INR Paper",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.screenWidth * 0.037,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: TextFormField(
                                  controller: paper,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    hintText: "Paper Price",
                                    hintStyle: TextStyle(),
                                    labelText: "Paper Price",
                                    labelStyle: TextStyle(),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      var data =
                                          await doctorController.UpdatePaper(
                                              k: {
                                            'D_Id': "${arg['D_Id']}",
                                            'Paper_Price': paper.text
                                          });
                                      if (data['result'] ==
                                          "Updatetion successfuly") {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("SuccessFluuy.."),
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                        await doctorController.getData();
                                        
                                      } else {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Falid.."),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/rupee.png"),
                      ),
                      Text(
                        " ${arg["Ink_Price"]} INR Ink",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.screenWidth * 0.037,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: TextFormField(
                                  controller: ink,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    hintText: "Ink Price",
                                    hintStyle: TextStyle(),
                                    labelText: "Ink Price",
                                    labelStyle: TextStyle(),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      var data =
                                          await doctorController.UpdateInk(k: {
                                        'D_Id': "${arg['D_Id']}",
                                        'Ink_Price': ink.text
                                      });
                                      if (data['result'] ==
                                          "Updatetion successfuly") {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("SuccessFluuy.."),
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                        await doctorController.getData();
                                        
                                      } else {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Falid.."),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Image.asset("assets/images/rupee.png"),
                      ),
                      Text(
                        " ${arg["Flims_Price"]} INR Flims",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.screenWidth * 0.037,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: TextFormField(
                                  controller: filem,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenHeight * 0.03),
                                    ),
                                    hintText: "Flims Price",
                                    hintStyle: TextStyle(),
                                    labelText: "Flims Price",
                                    labelStyle: TextStyle(),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      var data =
                                          await doctorController.UpdateFilm(k: {
                                        'D_Id': "${arg['D_Id']}",
                                        'Flims_Price': filem.text
                                      });
                                      if (data['result'] ==
                                          "Updatetion successfuly") {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("SuccessFluuy.."),
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                        await doctorController.getData();

                                      } else {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Falid.."),
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
