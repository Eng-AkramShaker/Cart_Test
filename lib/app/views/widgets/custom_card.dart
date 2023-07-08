// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable, non_constant_identifier_names, unused_local_variable, sized_box_for_whitespace, avoid_print, prefer_const_constructors

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../services/snackbar.dart';

class custom_Card extends StatelessWidget {
  custom_Card({
    super.key,
    required this.img,
    required this.description,
    required this.add_onPressed,
    required this.delete_onPressed,
    required this.count,
  });

  var img;
  var description;
  var count;
  var add_onPressed;
  var delete_onPressed;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      height: 130,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: my_colors().green,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),

      //  ( Image and description ) ========================================

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.only(right: 10),
              height: h,
              width: 150,
              child: Image.network(img)),

          Container(
            width: w / 5,
            child: Text(
              "$description",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),

          //  ( Buttons favorite Add and Delete ) ========================================

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: FavoriteButton(
                    iconSize: 55,
                    valueChanged: (isFavorite) {
                      SnackbarUtil().showDelete(message: "Done");
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    color: my_colors().white,
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: add_onPressed,
                        icon: Icon(Icons.add_circle_outlined,
                            color: my_colors().red, size: 25),
                      ),
                      //
                      // Text("$count"),
                      //
                      IconButton(
                        onPressed: delete_onPressed,
                        icon: Icon(Icons.delete,
                            color: my_colors().black, size: 22),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
