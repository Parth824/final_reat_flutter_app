import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:rentapp22/globals.dart';
import 'package:get/get.dart';
import 'package:rentapp22/size_config.dart';
import 'package:rentapp22/views/screens/Admin/bankaccount/controllers/bank_account_controller.dart';

class Add_Bank_Account extends StatefulWidget {
  const Add_Bank_Account({super.key});

  @override
  State<Add_Bank_Account> createState() => _Add_Bank_AccountState();
}

class _Add_Bank_AccountState extends State<Add_Bank_Account> {
  String? name;
  String? amount;

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String dropdownvalue = 'Select type';

  var items = [
    'CASH',
    'BANK',
  ];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  BankAccountController bankAccountController =
      Get.find<BankAccountController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "ADD BANK ACCOUNTS",
          style: TextStyle(fontSize: getProportionateScreenHeight(16)),
        ),
      ),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  text: "Bank Name",
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  onSaved: (val) {
                    name = val;
                  },
                  validator: (val) {
                    return null;
                  },
                  keyboardType: TextInputType.text),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                  text: "Opening Balance",
                  textInputAction: TextInputAction.done,
                  controller: amountController,
                  onSaved: (val) {
                    amount = val;
                  },
                  validator: (val) {
                    return null;
                  },
                  keyboardType: TextInputType.number),
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
              print(name);
              print(dropdownvalue);
              print(amount);
              Map k = {
                'bank_name': name,
                'type': dropdownvalue,
                'opening_price': amount,
              };
              await bankAccountController.InsertData(k: k);
            }
            // cirController.setLoding(isl: false);
            Get.back();
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
