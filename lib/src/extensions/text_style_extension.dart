import 'package:flutter/widgets.dart';
import 'package:mu_scaling_system/src/system.dart';

typedef TextStyleScalingCallback = double Function(double fontSize, int mu);

extension MuScalingTextStyleExtension on TextStyle {
  TextStyle scale(TextStyleScalingCallback scaleCallback) => copyWith(
        fontSize: fontSize == null
            ? null
            : scaleCallback(fontSize!, MuScaleSystem.instance.mu),
      );
}
