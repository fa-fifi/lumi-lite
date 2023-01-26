import 'package:flutter/material.dart';

class Snackbar {
  static SnackBar rounded(String text) => SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      shape: const StadiumBorder(),
      duration: Duration(milliseconds: text.length * 50),
      content: Chip(backgroundColor: Colors.black, label: Text(text)));
}
