import 'package:adigym/neumorphic/neu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NeuFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? size;
  final Color? color;
  const NeuFloatingActionButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeuButton(
      height: size ?? 58,
      width: size ?? 58,
      color: color,
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      padding: const EdgeInsets.all(0),
      child: child );
  }
}
