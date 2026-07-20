import 'package:flutter/material.dart';

extension ScreenExtension on BuildContext {
  double get screenwidth => MediaQuery.of(this).size.width;

  double get screenheight => MediaQuery.of(this).size.height;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get bodyHeight => screenheight - kToolbarHeight - padding.top;

  double get paddingHeight => screenheight - padding.top;
}
