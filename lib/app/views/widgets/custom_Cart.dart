// ignore_for_file: prefer_is_empty, camel_case_types, file_names

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../constant/colors.dart';
import '../../controller/controller.dart';

class Widget_Cart extends StatelessWidget {
  const Widget_Cart({
    super.key,
    required this.controller,
  });

  final myController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => badges.Badge(
          badgeContent: Text(
            "${controller.select_List.length}",
            style: TextStyle(color: my_colors().white),
          ),
          padding: const EdgeInsets.all(3.8),
          //badgeColor: Colors.white,
          showBadge: controller.select_List.length > 0,
          position: BadgePosition.topEnd(top: -10, end: -4),
          child: const Icon(Icons.shopping_cart_outlined)),
    );
  }
}
