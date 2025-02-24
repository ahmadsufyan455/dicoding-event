import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.sizeOf(this).height;

  double get deviceWidth => MediaQuery.sizeOf(this).width;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  void showSnackBar(String message, {Color backgroundColor = Colors.black}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
