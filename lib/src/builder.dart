import 'package:flutter/widgets.dart';
import 'package:mu_scaling_system/src/conditions.dart';
import 'package:mu_scaling_system/src/system.dart';

/// The main Builder for calculating Mu.
/// Pass [conditions] to it, according to which
/// Mu will be calculated, as well as [defaultValue],
/// if none of the conditions are suitable.
///
/// Important:
/// MuScalingBuilder must be up to MaterialApp,
/// CupertinoApp or WidgetsApp,
/// otherwise the design will not be adaptive to the screen size!
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
  Widget build(BuildContext context) => widget.child;
}
