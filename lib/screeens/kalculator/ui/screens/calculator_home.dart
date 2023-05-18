import 'package:adigym/const.dart';
import 'package:adigym/screeens/kalculator/logic/controllers/personal_controllers.dart';
import 'package:adigym/screeens/kalculator/ui/widget/neu_calc_result.dart';
import 'package:adigym/screeens/kalculator/ui/widget/neu_base_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({Key? key}) : super(key: key);

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final _personalController = Get.put(PersonalControllers());

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _personalController.getPersonal();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _personalController.dispose();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      _personalController.getPersonal();
      return Scaffold(
          backgroundColor: boxColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        _personalController.personalList.isEmpty
                            ? 'Adigym'
                            : _personalController.personalList[index].name ??
                                'Adigym',
                        style: sub1,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: NeuPersonalDataWidget(
                            title: 'Возраст',
                            count: _personalController.personalList.isEmpty
                                ? 0
                                : _personalController.personalList[index].age ??
                                    0, //22,
                            titleShow: 'возраст',
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: NeuPersonalDataWidget(
                            title: 'Вес',
                            count: _personalController.personalList.isEmpty
                                ? 0
                                : _personalController.personalList[index].weight ??
                                    0,
                            titleShow: 'вес',
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: NeuPersonalDataWidget(
                            title: 'Рост',
                            count: _personalController.personalList.isEmpty
                                ? 0
                                : _personalController.personalList[index].height ??
                                    0,
                            titleShow: 'рост',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    NeuCalcResultWidget(
                      title: 'Возраст',
                      count: 22,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    NeuCalcResultWidget(
                      title: 'Вес',
                      count: 70,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    NeuCalcResultWidget(
                      title: 'Рост',
                      count: 0,
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
