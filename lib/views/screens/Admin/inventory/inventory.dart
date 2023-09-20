import 'package:flutter/material.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/inventory/add_inventory_items_alert.dart';
import 'package:rentapp22/views/screens/Admin/inventory/inventory_bottomsheet.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  static String routeName = '/inventory';

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List<Map<String, dynamic>> InventoryList = [
    {
      "printer_name": "jk123",
      "Stock Qty": "1.0",
      "Purchase Price": "1.0rs",
      "Stock Value": "1.0",
      "Sales Price": "1.0rs",
    },
    {
      "printer_name": "jk1fhf23",
      "Stock Qty": "2.0",
      "Purchase Price": "2.0rs",
      "Stock Value": "2.0",
      "Sales Price": "2.0rs",
    },
    {
      "printer_name": "jk12h3",
      "Stock Qty": "3.0",
      "Purchase Price": "3.0rs",
      "Stock Value": "3.0",
      "Sales Price": "3.0rs",
    },
    {
      "printer_name": "jk1f23",
      "Stock Qty": "4.0",
      "Purchase Price": "4.0rs",
      "Stock Value": "4.0",
      "Sales Price": "4.0rs",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(10),
            left: getProportionateScreenHeight(13),
            right: getProportionateScreenHeight(13)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.06,
                    width: SizeConfig.screenWidth * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          labelText: "Search",
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  IconButton(
                      splashRadius: getProportionateScreenHeight(25),
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt_outlined)),
                ],
              ),
            ),
            Text(
              "All Items",
              style: TextStyle(
                  fontSize: getProportionateScreenHeight(24),
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: InventoryList.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                        height: SizeConfig.screenHeight * 0.22,
                        width: SizeConfig.screenWidth,
                        padding: EdgeInsets.all(
                          getProportionateScreenHeight(12),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getProportionateScreenHeight(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${InventoryList[i]['printer_name']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenHeight(19),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return InventoryBottom();
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.more_horiz_rounded),
                                  splashRadius:
                                      getProportionateScreenHeight(18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Stock Qty",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ),
                                    Text(
                                      "${InventoryList[i]['Stock Qty']}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(15),
                                    ),
                                    Text(
                                      "Purchase Price",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ),
                                    Text(
                                      "${InventoryList[i]['Purchase Price']}rs",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(80),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Stock Value",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ),
                                    Text(
                                      "${InventoryList[i]['Stock Value']}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(15),
                                    ),
                                    Text(
                                      "Sales Price",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                            getProportionateScreenHeight(15),
                                      ),
                                    ),
                                    Text(
                                      "${InventoryList[i]['Sales Price']}rs",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.black),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddInventoryAlert();
            },
          );
        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
