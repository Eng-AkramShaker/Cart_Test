// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, library_private_types_in_public_api, avoid_unnecessary_containers, avoid_print, await_only_futures, unused_import, prefer_const_constructors, unused_local_variable, prefer_typing_uninitialized_variables, camel_case_types, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, prefer_is_empty, non_constant_identifier_names, unused_element, constant_identifier_names, unused_field

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_Pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Company",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}
