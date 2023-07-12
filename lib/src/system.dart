import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:mu_scaling_system/src/conditions.dart';

/// Not part of the public api
class MuScaleSystem {
  static final MuScaleSystem instance = MuScaleSystem._();

  MuScaleSystem._();

  int _mu = 1;
  int get mu => _mu;
  int _defaultValue = 1;

  List<MuCondition> _conditions = <MuCondition>[];

  void updateConditions(
    List<MuCondition> conditions, {
    int defaultValue = 1,
  }) {
    _conditions = conditions;
    _mu = _defaultValue = defaultValue;
  }

  void updateScaleCalculations(BuildContext context) {
    final FlutterView currentView = View.of(context);
    final MediaQueryData mediaQueryData = MediaQueryData.fromView(currentView);

    for (final MuCondition condition in _conditions) {
      final int? result = condition.condition(mediaQueryData);
      if (result != null) {
        _mu = result;
        return;
      }
    }
    _mu = _defaultValue;
  }
}
