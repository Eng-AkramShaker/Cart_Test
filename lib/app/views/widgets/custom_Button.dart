// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, camel_case_types, file_names

import 'package:flutter/material.dart';

//  (   ) ============================================================

class Custom_Button extends StatelessWidget {
  Custom_Button({
    super.key,
    this.ontap,
    required this.color,
    required this.text,
  });
  var text;
  var color;
  var ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: 250,
        height: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(text),
      ),
    );
  }
}
