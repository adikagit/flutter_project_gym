import 'package:adigym/const.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class SwitchDetailsWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const SwitchDetailsWidget({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
        color: boxColor,
        borderRadius: 16,
        depth: 30,
        curveType: CurveType.none,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: sub2,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            child,
          ],
        ),
      ),
    );
  
  }
}
