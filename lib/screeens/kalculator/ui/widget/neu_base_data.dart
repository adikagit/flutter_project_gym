import 'package:adigym/const.dart';
import 'package:adigym/screeens/kalculator/logic/controllers/personal_controllers.dart';
import 'package:adigym/screeens/kalculator/ui/screens/add_personal.dart';
import 'package:adigym/screeens/kalculator/ui/widget/pod_prof_show.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NeuPersonalDataWidget extends StatelessWidget {
  final String title;
  final int count;
  final String titleShow;

  const NeuPersonalDataWidget({
    Key? key,
    required this.title,
    required this.count,
    required this.titleShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _personalController = Get.put(PersonalControllers());
    return ClayContainer(
      color: boxColor,
      borderRadius: 16,
      depth: 30,
      curveType: CurveType.none,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: sub2,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            count == 0
                ? GestureDetector(
                    onTap: () async {
                      await Get.to(AddPersonalScreens(status: 'add',));

                      _personalController.getPersonal();
                    },
                    child: Icon(Icons.add, size: 40, color: Colors.black26))
                : GestureDetector(
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (_) {
                          return Wrap(children: [
                            PodrobnoShowProf(
                              titleShow: titleShow,
                            )
                          ]);
                        },
                      );
                    },
                    child: Text(
                      '$count',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
