import 'package:adigym/const.dart';
import 'package:clay_containers/widgets/clay_animated_container.dart';
import 'package:flutter/material.dart';


class WeekDayButton extends StatelessWidget {
  final ValueChanged onChanged; //callback value change
  final int tag; //tag of button
  final Widget child;
  final bool active; // state of button
  const WeekDayButton({
    Key? key,
    required this.onChanged,
    required this.tag,
    required this.child,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => widget.onChanged(widget.tag),
      onTapUp: (_) => onChanged(tag),
      child: ClayAnimatedContainer(
        duration: const Duration(milliseconds: 100), //150
        color: boxColor,
        borderRadius: 100,
        depth: active ? -25 : 25,
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: child,
        ),
      ),
      // child: AnimatedContainer(
      //   height: 73,
      //   duration: const Duration(milliseconds: 150),
      //   padding: const EdgeInsets.all(16.0),
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     color: boxColor,
      //     boxShadow: _isPressed
      //         ? [
      //             const BoxShadow(
      //               blurRadius: 5,
      //               offset: Offset(6, 6),
      //               color: Color.fromRGBO(214, 223, 230, 1),
      //             ),
      //             BoxShadow(
      //               blurRadius: 10,
      //               offset: -Offset(1, 1),
      //               color: Colors.white,
      //             ),
      //           ]
      //         : [
      //             BoxShadow(
      //               blurRadius: 10,
      //               offset: -Offset(1, 1),
      //               color: Colors.white,
      //             ),
      //             const BoxShadow(
      //               blurRadius: 5,
      //               offset: Offset(6, 6),
      //               color: Color.fromRGBO(214, 223, 230, 1),
      //             )
      //           ],
      //   ),
      // ),
    );
  }
}
