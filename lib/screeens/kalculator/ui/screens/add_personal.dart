import 'dart:async';

import 'package:adigym/const.dart';
import 'package:adigym/screeens/calendar/ui/widgets/neu_text_filed.dart';
import 'package:adigym/neumorphic/neu_button.dart';
import 'package:adigym/screeens/kalculator/logic/controllers/personal_controllers.dart';
import 'package:adigym/screeens/kalculator/logic/models/personal.dart';
import 'package:adigym/screeens/kalculator/ui/widget/neu_age_widget.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPersonalScreens extends StatefulWidget {
  final String status;
  const AddPersonalScreens({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  _AddPersonalScreensState createState() => _AddPersonalScreensState();
}

class _AddPersonalScreensState extends State<AddPersonalScreens> {
  final PersonalControllers _personalController =
      Get.put(PersonalControllers());

  final TextEditingController _namePersonalController = TextEditingController();
  final TextEditingController _weightPersonalController =
      TextEditingController();
  final TextEditingController _heightExercisesController =
      TextEditingController();

  int _age = 0;

  Timer? _timer;
  bool _longPressCanceled = false;

  void _cancelIncrease() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _longPressCanceled = true;
  }

  void _agePlus() {
    setState(() {
      if (_age < 100) {
        _age++;
      }
    });
  }

  void _ageMinus() {
    setState(() {
      if (_age > 1) {
        _age--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.status == 'update') {
      _namePersonalController.text =
          _personalController.personalList[0].name ?? '';
      _weightPersonalController.text =
          '${_personalController.personalList[0].weight ?? 0}';
      _heightExercisesController.text =
          '${_personalController.personalList[0].height ?? 0}';
      _age = _personalController.personalList[0].age ?? 0;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _namePersonalController.dispose();
    _weightPersonalController.dispose();
    _heightExercisesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: boxColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: boxColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios, size: 25, color: Colors.grey),
        ),
        title: Text(
          widget.status == 'add' ? 'Добавление' : 'Обновление',
          style: sub1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NeuTextFiled(
                hint: 'Имя',
                controller: _namePersonalController,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ClayContainer(
                      color: boxColor,
                      borderRadius: 16,
                      depth: 30,
                      curveType: CurveType.none,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'Вес',
                              style: sub3,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            NeuTextFiled(
                                hint: 'кг',
                                controller: _weightPersonalController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: ClayContainer(
                      color: boxColor,
                      borderRadius: 16,
                      depth: 30,
                      curveType: CurveType.none,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              'Рост',
                              style: sub3,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            NeuTextFiled(
                                hint: 'см',
                                controller: _heightExercisesController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              NeuAgeWidget(
                title: 'Возраст',
                count: _age,
                onTapMinus: _ageMinus,
                onLongPressEndMinus: (LongPressEndDetails longPressEndDetails) {
                  _cancelIncrease();
                },
                onLongPressMinus: () {
                  _longPressCanceled = false;
                  Future.delayed(Duration(milliseconds: 300), () {
                    if (!_longPressCanceled) {
                      _timer = Timer.periodic(
                          Duration(milliseconds: 150), (timer) => _ageMinus());
                    }
                  });
                },
                onLongPressUpMinus: () {
                  _cancelIncrease();
                },
                onLongPressMoveUpdateMinus:
                    (LongPressMoveUpdateDetails longPressMoveUpdateDetails) {
                  if (longPressMoveUpdateDetails
                          .localOffsetFromOrigin.distance >
                      20) {
                    _cancelIncrease();
                  }
                },
                onTapPlus: _agePlus,
                onLongPressEndPlus: (LongPressEndDetails longPressEndDetails) {
                  _cancelIncrease();
                },
                onLongPressPlus: () {
                  _longPressCanceled = false;
                  Future.delayed(Duration(milliseconds: 300), () {
                    if (!_longPressCanceled) {
                      _timer = Timer.periodic(
                        Duration(milliseconds: 150),
                        (timer) => _agePlus(),
                      );
                    }
                  });
                },
                onLongPressUpPlus: () {
                  _cancelIncrease();
                },
                onLongPressMoveUpdatePlus:
                    (LongPressMoveUpdateDetails longPressMoveUpdateDetails) {
                  if (longPressMoveUpdateDetails
                          .localOffsetFromOrigin.distance >
                      20) {
                    _cancelIncrease();
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: NeuButton(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  color: boxColor2,
                  borderRadius: BorderRadius.circular(16),
                  onTap: widget.status == 'add' ? _validateDate : _updateDate,
                  child: Text(
                    widget.status == 'add' ? 'Добавить' : 'Обновить',
                    style: sub2,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateDate() {
    _addPersonalToDb();
    Get.back();
  }

  _updateDate() async {
    await _personalController.updatePersonal(Personal(
      id: 1,
      name: _namePersonalController.text.isEmpty
          ? 'Adigym'
          : _namePersonalController.text.replaceAll('\n', ''),
      age: _age == 0 ? 0 : _age,
      height: _heightExercisesController.text.isEmpty
          ? 0
          : int.tryParse(_heightExercisesController.text),
      weight: _weightPersonalController.text.isEmpty
          ? 0
          : int.tryParse(_weightPersonalController.text),
    ));
    _personalController.getPersonal();
    Get.back();
  }

  _addPersonalToDb() async {
    await _personalController.addPersonal(
        personal: Personal(
      name: _namePersonalController.text.isEmpty
          ? 'Adigym'
          : _namePersonalController.text.replaceAll('\n', ''),
      age: _age == 0 ? 0 : _age,
      height: _heightExercisesController.text.isEmpty
          ? 0
          : int.tryParse(_heightExercisesController.text),
      weight: _weightPersonalController.text.isEmpty
          ? 0
          : int.tryParse(_weightPersonalController.text),
    ));
  }
}
