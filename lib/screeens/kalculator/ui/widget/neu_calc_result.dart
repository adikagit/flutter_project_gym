import 'package:adigym/const.dart';
import 'package:adigym/screeens/kalculator/ui/screens/add_personal.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NeuCalcResultWidget extends StatelessWidget {
  final String title;
  final double count;
  const NeuCalcResultWidget({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClayContainer(
        color: boxColor,
        borderRadius: 16,
        depth: 30,
        curveType: CurveType.none,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: sub2,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              count == 0
                  ? GestureDetector(
                    onTap: () {
                      //Get.to(AddPersonalScreens(status: 'add',));
                    },
                      child: Icon(Icons.add, size: 30, color: Colors.black26))
                  : Text(
                      '$count',
                      style: sub1,
                      textAlign: TextAlign.center,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
