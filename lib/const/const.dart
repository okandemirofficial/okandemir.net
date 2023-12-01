import 'package:flutter/material.dart';
import 'package:portfolio_v2/const/theme.dart';

class Const {
  static final defaultShape = RoundedRectangleBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(15),
    ),
    side: BorderSide(
      color: appColorsDark.primary,
      width: 2,
    ),
  );
}
