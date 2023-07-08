// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: my_colors().blue,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  alignment: Alignment.center,
                  height: 400,
                  width: 400,
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              Text("My Company",
                  style: TextStyle(
                    color: my_colors().white,
                  )),
            ],
          ),
        ));
  }
}
