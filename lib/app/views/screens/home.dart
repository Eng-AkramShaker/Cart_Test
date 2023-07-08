// ignore_for_file: library_private_types_in_public_api, avoid_print, unrelated_type_equality_checks, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../controller/controller.dart';
import '../widgets/convex_AppBar.dart';
import '../widgets/custom_Cart.dart';
import '../widgets/custom_card.dart';
import 'cart .dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(myController());
  Map? map;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: my_colors().green,
        title: const Center(child: Text("My Company")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25, top: 9),
            child: InkWell(
                onTap: () {
                  Get.to(Cart_Page());
                },
                child: Widget_Cart(controller: controller)),
          )
        ],
      ),
      body: controller.product_list.isEmpty
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : SafeArea(
              child: Obx(
                () => Stack(children: [
                  SingleChildScrollView(
                    child: Container(
                      height: h / 1.1,
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h / 1.23,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: controller.product_list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return custom_Card(
                                  img: controller.product_list[index]
                                      ["thumbnail"],
                                  description: controller.product_list[index]
                                      ["price"],
                                  add_onPressed: () {
                                    controller.add_onPressed(index: index);
                                  },
                                  delete_onPressed: () {
                                    controller.delete_onPressed();
                                  },
                                  count: controller.select_List.length,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  ( Bottom AppBar ) ============================================================

                  convexAppBar(),
                ]),
              ),
            ),
    );
  }
}
