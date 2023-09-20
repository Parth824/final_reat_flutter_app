import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// import 'package:intl/intl.dart';
import 'package:rentapp22/size_config.dart';
import 'package:get/get.dart';
import 'package:rentapp22/views/screens/Admin/expense/controllers/cir_controller.dart';

import 'controllers/expense_controller.dart';

class AlertDialogExpense extends StatefulWidget {
  const AlertDialogExpense({super.key});

  @override
  State<AlertDialogExpense> createState() => _AlertDialogExpenseState();
}

class _AlertDialogExpenseState extends State<AlertDialogExpense> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _decEditingController = TextEditingController();
  TextEditingController _categoryEditingController = TextEditingController();
  TextEditingController _amountEditingController = TextEditingController();

  Uint8List? image;
  String? name;
  String? dec;
  String? category;
  String? amount;
  String? date;
  String? imagename;
  ImagePicker imagePicker = ImagePicker();

  ExpenseController expenseController = Get.find<ExpenseController>();

  // @override
  // void initState() {
  //   getdata();
  //   super.initState();
  // }
  //
  // getdata() async {
  //   await expenseController.getData();
  // }
  Future<void> _pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File imageFile = File(pickedFile!.path);
      print(imageFile.path.split('/').last);
      imagename = imageFile.path.split('/').last;
      image = await imageFile.readAsBytes();
    }
  }

  ExCirController cirController = Get.put(ExCirController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "Add Expense",
          style: TextStyle(),
        ),
      ),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  height: SizeConfig.screenHeight * 0.12,
                  width: SizeConfig.screenWidth * 0.55,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenHeight(10),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.grey.shade600,
                        ),
                        Text(
                          "Add Bill",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                  controller: _nameEditingController,
                  onSaved: (val) {
                    name = val;
                  },
                  text: "Name",
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {}
                    return null;
                  },
                  keyboardType: TextInputType.text),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                  controller: _decEditingController,
                  onSaved: (val) {
                    dec = val;
                  },
                  text: "Description",
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {}
                    return null;
                  },
                  keyboardType: TextInputType.text),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                  controller: _categoryEditingController,
                  onSaved: (val) {
                    category = val;
                  },
                  text: "Category",
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {}
                    return null;
                  },
                  keyboardType: TextInputType.text),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildTextFormFieldEmployeeExpense(
                  controller: _amountEditingController,
                  onSaved: (val) {
                    amount = val;
                  },
                  text: "Amount",
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {}
                    return null;
                  },
                  keyboardType: TextInputType.number),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              TextFormField(
                controller: _textEditingController,
                onSaved: (val) {
                  date = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {}
                  return null;
                },
                onTap: () async {
                  DateTime? newSelectedDate = await showDatePicker(
                    context: context,
                    initialDate:
                        _selectedDate != null ? _selectedDate! : DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2040),
                  );

                  if (newSelectedDate != null) {
                    _selectedDate = newSelectedDate;
                    _textEditingController
                      ..text = DateFormat("yyyy-MM-dd").format(_selectedDate!)
                      ..selection = TextSelection.fromPosition(TextPosition(
                          offset: _textEditingController.text.length,
                          affinity: TextAffinity.upstream));
                  }
                },
                focusNode: AlwaysDisabledFocusNode(),
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenHeight * 0.03),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenHeight * 0.03),
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.screenHeight * 0.03),
                  ),
                  hintText: "Date",
                  hintStyle: TextStyle(),
                  labelText: "Date",
                  labelStyle: TextStyle(),
                ),
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
              print(name);
              print(category);
              print(amount);
              print(date);
              print(dec);
              Map k = {
                'image': image,
                'name': name,
                'category': category,
                'amount': amount,
                'date': date,
                'dec': dec,
                'e_id': "null",
                'imagename': imagename,
              };
              await expenseController.InsertData(k: k);
            }
            cirController.setLoding(isl: false);
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
      keyboardType: keyboardType,
      textInputAction: textInputAction,
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
