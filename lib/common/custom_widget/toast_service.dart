import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToastService {
  show(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.black);
  }

  showInCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb:3,
        backgroundColor: Colors.blue,
        gravity: ToastGravity.CENTER);
  }
}
