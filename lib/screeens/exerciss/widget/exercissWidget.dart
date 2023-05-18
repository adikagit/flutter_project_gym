import 'package:adigym/const.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExercissWidget extends StatelessWidget {
  final String image;
  final String title;
  VoidCallback? onTap;
  ExercissWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClayContainer(
        color: boxColor,
        borderRadius: 16,
        depth: 30,
        curveType: CurveType.none,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClayContainer(
                height: 150,
                width: 150,
                color: boxColor,
                borderRadius: 16,
                depth: -30,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(image //'assets/images/chel.png',
                      ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    title,
                    style: sub2,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
