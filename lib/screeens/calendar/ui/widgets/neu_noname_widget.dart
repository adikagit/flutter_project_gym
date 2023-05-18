import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_flo_act_button.dart.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class NeuNonameWidget extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onTapPlus;
  final VoidCallback onTapMinus;
  const NeuNonameWidget(
      {Key? key,
      required this.title,
      required this.count,
      required this.onTapPlus,
      required this.onTapMinus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
        color: boxColor,
        borderRadius: 16,
        depth: 30,
        curveType: CurveType.none,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Text(
                title,
                style: sub3,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$count',
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeuFloatingActionButton(
                    onTap: onTapMinus,
                    child: Icon(Icons.remove, size: 30, color: Colors.black12),
                  ),
                  NeuFloatingActionButton(
                    onTap: onTapPlus,
                    child: Icon(Icons.add, size: 30, color: Colors.black12),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
