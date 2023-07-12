import 'package:flutter/widgets.dart';
import 'package:mu_scaling_system/src/conditions.dart';
import 'package:mu_scaling_system/src/system.dart';

class MuScalingBuilder extends StatefulWidget {
  final Widget child;
  final List<MuCondition> conditions;
  final int defaultValue;

  const MuScalingBuilder({
    required this.child,
    required this.conditions,
    this.defaultValue = 1,
    super.key,
  });

  @override
  State<MuScalingBuilder> createState() => _MuScalingBuilderState();
}

class _MuScalingBuilderState extends State<MuScalingBuilder> {
  @override
  void initState() {
    super.initState();
    MuScaleSystem.instance.updateConditions(
      widget.conditions,
      defaultValue: widget.defaultValue,
    );
  }

  @override
  void didUpdateWidget(covariant MuScalingBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
    MuScaleSystem.instance.updateConditions(
      widget.conditions,
      defaultValue: widget.defaultValue,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MuScaleSystem.instance.updateScaleCalculations(context);
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        key: ObjectKey(MediaQuery.of(context)),
        child: widget.child,
      );
}
