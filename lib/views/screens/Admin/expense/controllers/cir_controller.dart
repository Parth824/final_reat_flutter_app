import 'package:get/get.dart';

class ExCirController extends GetxController {
  RxBool isloding = false.obs;

  setLoding({required bool isl}) {
    isloding.value = isl;
  }
}
