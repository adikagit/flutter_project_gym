import 'package:adigym/const.dart';
import 'package:flutter/material.dart';

class NeuButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  final GestureLongPressStartCallback? onLongPressStart;
  final GestureLongPressEndCallback? onLongPressEnd;
  final GestureLongPressCallback? onLongPress;
  final GestureLongPressUpCallback? onLongPressUp;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  const NeuButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.height, 
    this.width,
    this.padding,
    this.color,
    this.borderRadius,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onLongPress,
    this.onLongPressUp,
    this.onLongPressMoveUpdate,
  }) : super(key: key);

  @override
  _NeuButtonState createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  void _onPointerDown() {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        _onPointerDown();
      },
      onPointerUp: _onPointerUp,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPressStart: widget.onLongPressStart,
        onLongPressEnd: widget.onLongPressEnd,
        onLongPress: widget.onLongPress,
        onLongPressUp: widget.onLongPressUp,
        onLongPressMoveUpdate: widget.onLongPressMoveUpdate,
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: widget.color ?? boxColor,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
            //shape: widget.shape?? BoxShape.rectangle,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      blurRadius: 8,
                      offset: -const Offset(3, 3),
                      color: Colors.white,
                    ),
                    const BoxShadow(
                      blurRadius: 8,
                      offset: Offset(5, 5),
                      color: Color.fromRGBO(214, 223, 230, 1),
                    )
                  ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
