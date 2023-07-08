// ignore_for_file: camel_case_types, non_constant_identifier_names, deprecated_member_use, avoid_print, unused_field, unnecessary_overrides, prefer_const_constructors, prefer_is_empty

import 'package:get/get.dart';
import '../views/screens/home.dart';
import '../views/screens/splash.dart';
import '../services/api_Services.dart';
import '../services/snackbar.dart';

class myController extends GetxController {
  var product_list = [].obs;
  var select_List = [].obs;
  var num = 0.obs;
  Map map = {}.obs;

  @override
  void onReady() {
    super.onReady();
    fetchProducts();
    Get.to(Splash());
    Future.delayed(Duration(seconds: 4), () {
      Get.to(HomePage());
    });
  }

  //  fetchProducts ===============================================================

  fetchProducts() async {
    try {
      product_list.isEmpty;
      await ApiServices().fetchProducts();
    } finally {
      product_list.isNotEmpty;
    }
  }

  //  add ===============================================================
  add_onPressed({required index}) {
    map = product_list[index];
    select_List.add(map);
    for (int i = 0; i < select_List.length; i++) {
      num += int.parse(select_List[i]["price"].toString());
    }
    SnackbarUtil().showDelete(message: "This product has been added");
  }

//  delete ================================================================
  delete_onPressed() {
    for (int i = 0; i < select_List.length; i++) {
      num -= int.parse(select_List[i]["price"].toString());
      if (num < 0) {
        num = 0.obs;
      }
      if (select_List.length >= 0) {
        select_List.removeAt(0);
      }
      if (select_List.length == 0) {
        num = 0.obs;
      }
    }
    SnackbarUtil().showDelete(message: "This product has been removed");
  }
}
