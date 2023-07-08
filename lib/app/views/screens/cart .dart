// ignore_for_file: library_private_types_in_public_api, camel_case_types, avoid_unnecessary_containers, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, unused_import, avoid_function_literals_in_foreach_calls, file_names, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/colors.dart';
import '../../controller/controller.dart';
import '../../services/snackbar.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_card.dart';
import 'home.dart';

class Cart_Page extends StatelessWidget {
  Cart_Page({super.key});

  final controller = Get.put(myController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: my_colors().white),
          onPressed: () {
            Get.to(() => HomePage());
          },
        ),
        backgroundColor: my_colors().green,
        title: const Center(child: Text("Cart")),
      ),
      body: SafeArea(
          child: Obx(
        () => Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  child: Stack(children: [
                    //  ( Bottom Clear All ) ============================================================
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.num = 0.obs;
                              SnackbarUtil()
                                  .showDelete(message: "Delete all products");
                              controller.select_List.clear();
                            },
                            child: Text(
                              "Clear All",
                              style: TextStyle(
                                  color: my_colors().red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //  ( select_List  ) ============================================================

                    Container(
                      height: h,
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: h,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: controller.select_List.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return custom_Card(
                                      img: controller.select_List[index]
                                          ["thumbnail"],
                                      description: controller.select_List[index]
                                          ["title"],
                                      add_onPressed: () {
                                        controller.add_onPressed(index: index);
                                      },
                                      delete_onPressed: () {
                                        controller.delete_onPressed();
                                      },
                                      count: "8");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                )),
            //  ( Total num ) ============================================================

            Expanded(
                child: Container(
              color: my_colors().white,
              child: SizedBox(
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Custom_Button(
                      text: "Total amount  ${controller.num} \$",
                      color: const Color.fromARGB(255, 214, 214, 214),
                    ),

                    //  ( Confirm) ============================================================

                    Padding(
                      padding: EdgeInsets.only(top: h / 30),
                      child: Custom_Button(
                        text: "Confirm Order",
                        color: my_colors().orange,
                        ontap: () {
                          SnackbarUtil()
                              .showDelete(message: "Delete all products");
                          controller.num = 0.obs;
                          controller.select_List.clear();
                          Get.to(() => HomePage());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      )),
    );
  }
}
