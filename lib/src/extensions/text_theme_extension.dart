import 'package:flutter/material.dart';
import 'package:mu_scaling_system/src/extensions/text_style_extension.dart';

extension MuScalingTextThemeExtension on TextTheme {
  TextTheme scale(TextStyleScalingCallback scaleCallback) => copyWith(
        bodyLarge: bodyLarge?.scale(scaleCallback),
        bodyMedium: bodyMedium?.scale(scaleCallback),
        bodySmall: bodySmall?.scale(scaleCallback),
        labelLarge: labelLarge?.scale(scaleCallback),
        displayLarge: displayLarge?.scale(scaleCallback),
        displayMedium: displayMedium?.scale(scaleCallback),
        displaySmall: displaySmall?.scale(scaleCallback),
        headlineMedium: headlineMedium?.scale(scaleCallback),
        headlineSmall: headlineSmall?.scale(scaleCallback),
        titleLarge: titleLarge?.scale(scaleCallback),
        headlineLarge: headlineLarge?.scale(scaleCallback),
        labelMedium: labelMedium?.scale(scaleCallback),
        labelSmall: labelSmall?.scale(scaleCallback),
        titleMedium: titleMedium?.scale(scaleCallback),
        titleSmall: titleSmall?.scale(scaleCallback),
      );
}
