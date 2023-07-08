// ignore_for_file: unused_element

import 'package:fluttertoast/fluttertoast.dart';

class SnackbarUtil {
  void showAdd({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        // backgroundColor: red,
        // textColor: white,
        fontSize: 16.0);
  }

  void showDelete({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        // backgroundColor: red,
        // textColor: white,
        fontSize: 16.0);
  }
}
