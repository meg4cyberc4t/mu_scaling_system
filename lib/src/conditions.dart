import 'package:flutter/widgets.dart';

class MuCondition {
  late final int? Function(MediaQueryData mediaQueryData) condition;

  MuCondition.custom(this.condition);

  MuCondition.fromSize(int? Function(Size size) sizeCondition) {
    condition =
        (MediaQueryData mediaQueryData) => sizeCondition(mediaQueryData.size);
  }

  MuCondition.side({
    required int mu,
    double? minShortestSide,
    double? maxShortestSide,
    double? minLongestSide,
    double? maxLongestSide,
  }) : assert(
          !(minLongestSide == null &&
              maxLongestSide == null &&
              minShortestSide == null &&
              maxShortestSide == null),
          'Conditions are not specified',
        ) {
    condition = (MediaQueryData mediaQueryData) {
      if ((minShortestSide == null ||
              mediaQueryData.size.shortestSide > minShortestSide) &&
          (maxShortestSide == null ||
              mediaQueryData.size.shortestSide < maxShortestSide) &&
          (minLongestSide == null ||
              mediaQueryData.size.longestSide > minLongestSide) &&
          (maxLongestSide == null ||
              mediaQueryData.size.longestSide < maxLongestSide)) {
        return mu;
      }
      return null;
    };
  }
}
