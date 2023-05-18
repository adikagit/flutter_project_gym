import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_button.dart';
import 'package:adigym/screeens/kalculator/logic/controllers/personal_controllers.dart';
import 'package:adigym/screeens/kalculator/ui/screens/add_personal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PodrobnoShowProf extends StatelessWidget {
  final String titleShow;
  const PodrobnoShowProf({
    Key? key,
    required this.titleShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _personalController = Get.put(PersonalControllers());
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                child: Column(
                  children: [
                    NeuButton(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Удалить $titleShow',
                        style: sub1,
                        textAlign: TextAlign.center,
                      ),
                      onTap: () async {
                        // await Get.to(AddPersonalScreens(
                        //   status: 'add',
                        // ));

                        // _personalController.getPersonal();
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    NeuButton(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Обновить',
                        style: sub1,
                        textAlign: TextAlign.center,
                      ),
                      onTap: () async {
                        await Get.to(AddPersonalScreens(
                          status: 'update',
                        ));
                        Get.back();
                        _personalController.getPersonal();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
