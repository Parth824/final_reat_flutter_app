import 'package:flutter/material.dart';
import 'package:rentapp22/components/default_button.dart';

import '../../../../size_config.dart';

class InventoryBottom extends StatefulWidget {
  const InventoryBottom({super.key});

  @override
  State<InventoryBottom> createState() => _InventoryBottomState();
}

class _InventoryBottomState extends State<InventoryBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      padding: EdgeInsets.all(
        getProportionateScreenHeight(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Add Stock",
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
                splashRadius: getProportionateScreenHeight(20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current Stock",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getProportionateScreenHeight(15),
                    ),
                  ),
                  Text(
                    "0.0",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getProportionateScreenHeight(15),
                    ),
                  ),
                  Text(
                    "14-06-2023",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Text(
            "Enter Quantity",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Quantity",
            ),
          ),
          Text(
            "Remark (Optional)",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenHeight(16),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Remark",
            ),
          ),
          DefaultButton(text: "Save", press: () {}),
        ],
      ),
    );
  }
}
