import 'package:flutter/material.dart';

class Snackbar {
  static SnackBar floating(String text) => SnackBar(
      margin: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
      duration: Duration(milliseconds: text.length * 50),
      content: Chip(
        backgroundColor: Colors.black,
        label: Text(text,
            textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
      ));
}
