// ignore_for_file: prefer_const_declarations, avoid_print, deprecated_member_use, non_constant_identifier_names, unused_field, unnecessary_brace_in_string_interps, file_names

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../constant/api_links.dart';
import '../controller/controller.dart';
import '../models/Product.dart';

class ApiServices {
  final String _url = "${ApiEndPoints.baseUrl}products";
  Dio? _dio;
  final all_Data = Get.put(myController());
  ApiServices() {
    _dio = Dio();
  }
  Future fetchProducts() async {
    try {
      Response response = await _dio!.get(_url);
      Product productResponse = Product.fromJson(response.data);
      all_Data.product_list.addAll(response.data['products']);
      return productResponse.products;
    } on DioError catch (e) {
      print(e);
    }
  }
}
