import 'package:flutter/material.dart';
import 'package:rentapp22/globals.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/bankaccount/add_bank_account.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Admin/bankaccount/controllers/bank_account_controller.dart';

class BankAccountPage extends StatefulWidget {
  const BankAccountPage({super.key});

  static String routeName = '/bankaccount';

  @override
  State<BankAccountPage> createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  BankAccountController bankAccountController =
      Get.put(BankAccountController());

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    await bankAccountController.getData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(() {
        return (bankAccountController.accountlist.value.isNotEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.screenWidth / 100),
                  ),
                  ...bankAccountController.accountlist.map(
                    (e) => Container(
                      height: SizeConfig.screenHeight / 10,
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8)),
                      child: Card(
                        color: const Color(0xffB3E6FF),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth / 20,
                            ),
                            Image(
                              image: (e['Type'] == "CASH")
                                  ? AssetImage(
                                      "assets/images/Dollar.png",
                                    )
                                  : AssetImage(
                                      "assets/images/Museum.png",
                                    ),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth / 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e["Bank_Name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeConfig.screenHeight / 40),
                                ),
                                Text(
                                  e["Opening_Price"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeConfig.screenHeight / 50),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Add_Bank_Account();
            },
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Bank Account"),
      ),
    );
  }
}
