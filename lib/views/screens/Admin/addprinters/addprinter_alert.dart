import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:rentapp22/size_config.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Admin/addprinters/addprinters.dart';
import 'package:rentapp22/views/screens/Admin/addprinters/controllers/addprinter_controller.dart';

class AlertItems extends StatefulWidget {
  const AlertItems({super.key});

  @override
  State<AlertItems> createState() => _AlertItemsState();
}

class _AlertItemsState extends State<AlertItems> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String dropdownvalue = 'Paper';

  var items = [
    'Flims',
    'Paper',
    'Ink',
    'Jelly',
  ];

  String? name;
  String? descript;
  String? type;
  String? price;
  String? unit;
  String gst = "0";

  TextEditingController nameController = TextEditingController();
  TextEditingController descripController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController gstController = TextEditingController();

  AddItemController addItemController = Get.put(AddItemController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "Add Items",
          style: TextStyle(),
        ),
      ),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextFormFieldEmployeeExpense(
                text: "Product Name",
                textInputAction: TextInputAction.next,
                controller: nameController,
                keyboardType: TextInputType.text,
                onSaved: (p0) {
                  name = p0;
                },
                validator: (p0) {
                  return null;
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                text: "Product Description",
                textInputAction: TextInputAction.next,
                controller: descripController,
                keyboardType: TextInputType.text,
                onSaved: (p0) {
                  descript = p0;
                },
                validator: (p0) {
                  return null;
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              CustomSearchableDropDown(
                items: items,
                label: dropdownvalue,
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.screenHeight * 0.03),
                  border: Border.all(),
                ),
                dropDownMenuItems: items.map((e) {
                  return e;
                }).toList(),
                dropdownBackgroundColor: Colors.white,
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
                onChanged: (value) {
                  setState(() {
                    dropdownvalue = value;
                  });
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                text: "Product Price",
                textInputAction: TextInputAction.next,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSaved: (p0) {
                  price = p0;
                },
                validator: (p0) {
                  return null;
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                text: "Product Unit",
                textInputAction: TextInputAction.next,
                controller: unitController,
                keyboardType: TextInputType.number,
                onSaved: (p0) {
                  unit = p0;
                },
                validator: (p0) {
                  return null;
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                text: "GST",
                textInputAction: TextInputAction.done,
                controller: gstController,
                keyboardType: TextInputType.number,
                onSaved: (p0) {
                  gst = p0!;
                },
                validator: (p0) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              Map k = {
                'Pro_Name': name,
                'Pro_Description': descript,
                'Pro_Type': dropdownvalue,
                'Pro_Price': price,
                'Pro_Unit': unit,
                'GST': (gst == '') ? '0' : gst
              };
              print(k);
              Navigator.pop(context);
              int data = await addItemController.InsertData(data: k);
              await addItemController.getData();
            }
          },
          child: Text(
            "Add",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  TextFormField buildTextFormFieldEmployeeExpense({
    required TextInputAction textInputAction,
    required String text,
    required TextEditingController controller,
    required void Function(String?)? onSaved,
    required String? Function(String?)? validator,
    required TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.03),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight * 0.03),
        ),
        hintText: text,
        hintStyle: TextStyle(),
        labelText: text,
        labelStyle: TextStyle(),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
