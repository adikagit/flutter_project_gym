import 'package:adigym/const.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/widgets.dart';

class NeuContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? borderRadius;
  final int? depth;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  const NeuContainer(
      {Key? key,
      required this.child,
      this.color,
      this.borderRadius,
      this.depth,
      this.height,
      this.width,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: height,
      width: width,
      color: color ?? boxColor,
      borderRadius: borderRadius ?? 16,
      depth: depth ?? 30,
      curveType: CurveType.none,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
