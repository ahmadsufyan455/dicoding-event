import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  double get deviceHeight => MediaQuery.sizeOf(this).height;

  double get deviceWidth => MediaQuery.sizeOf(this).width;
}
