// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../screens/cart .dart';

class convexAppBar extends StatelessWidget {
  final controller = Get.put(myController());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Obx(
      () => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: SizedBox(
          width: w / 1.01,
          child: ConvexAppBar(
              initialActiveIndex: 1,
              height: 50,
              top: -30,
              curveSize: 100,
              backgroundColor: const Color.fromARGB(255, 31, 70, 27),
              items: [
                TabItem(
                    icon: Icons.calculate,
                    title: 'Total amount  ${controller.num} \$'),
                const TabItem(icon: Icons.home, title: 'Home'),
                const TabItem(icon: Icons.shopping_bag, title: 'basket'),
              ],
              onTap: (int i) {
                if (i == 0) {
                  // Get.to(() => Cart_Page());
                }
                if (i == 2) {
                  Get.to(() => Cart_Page());
                }
              }),
        ),
      ),
    );
  }
}
