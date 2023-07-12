import 'package:mu_scaling_system/src/system.dart';

extension MuScalingNumExtension on num {
  double get mu => (this * MuScaleSystem.instance.mu).toDouble();
}
