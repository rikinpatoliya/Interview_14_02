import 'package:flutter/material.dart';

extension StyledWidget on Widget {
  Widget expanded({
    int flex = 1,
  }) =>
      Expanded(
        flex: flex,
        child: this,
      );

  Widget inkWell({GestureTapCallback? onTap}) => InkWell(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: onTap,
        child: this,
      );
}

extension HeightWidget on int {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}
