import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_button.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class NeuAgeWidget extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onTapPlus;
  final VoidCallback onTapMinus;

  final GestureLongPressCallback? onLongPressPlus;
  final GestureLongPressEndCallback? onLongPressEndPlus;
  final GestureLongPressUpCallback? onLongPressUpPlus;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdatePlus;

  final GestureLongPressCallback? onLongPressMinus;
  final GestureLongPressEndCallback? onLongPressEndMinus;
  final GestureLongPressUpCallback? onLongPressUpMinus;
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdateMinus;
  const NeuAgeWidget(
      {Key? key,
      required this.title,
      required this.count,
      required this.onTapPlus,
      required this.onTapMinus,
      this.onLongPressEndPlus,
      this.onLongPressEndMinus,
      this.onLongPressPlus,
      this.onLongPressUpPlus,
      this.onLongPressMoveUpdatePlus,
      this.onLongPressMinus,
      this.onLongPressUpMinus,
      this.onLongPressMoveUpdateMinus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
        color: boxColor,
        borderRadius: 16,
        depth: 30,
        curveType: CurveType.none,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                title,
                style: sub3,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeuButton(
                    color: boxColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 18),
                    borderRadius: BorderRadius.circular(16),
                    child: Icon(Icons.remove, size: 30, color: Colors.black26),
                    onTap: onTapMinus,
                    onLongPressEnd: onLongPressEndMinus,
                    onLongPress: onLongPressMinus,
                    onLongPressUp: onLongPressUpMinus,
                    onLongPressMoveUpdate: onLongPressMoveUpdateMinus,
                  ),
                  Text(
                    '$count',
                    style: TextStyle(fontSize: 40),
                  ),
                  NeuButton(
                    color: boxColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 18),
                    borderRadius: BorderRadius.circular(16),
                    child: Icon(Icons.add, size: 30, color: Colors.black26),
                    onTap: onTapPlus,
                    onLongPressEnd: onLongPressEndPlus,
                    onLongPress: onLongPressPlus,
                    onLongPressUp: onLongPressUpPlus,
                    onLongPressMoveUpdate: onLongPressMoveUpdatePlus,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
