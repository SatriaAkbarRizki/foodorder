import 'package:flutter/material.dart';

enum StatusSnackBar { succes, error }

extension SnackbarExtension on BuildContext {
  void showSnackBarMessage(
    String message,
    StatusSnackBar status, {
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        duration: duration,

        backgroundColor: StatusSnackBar.succes == StatusSnackBar.succes
            ? Colors.green
            : Colors.red,
      ),
    );
  }
}
