import 'dart:io';

import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/op_scaffold.dart';
import 'package:adigym/screeens/calendar/logic/controllers/task_controllers.dart';
import 'package:adigym/screeens/calendar/logic/models/task.dart';
import 'package:adigym/screeens/calendar/ui/widgets/neu_mass_snar_widget.dart';
import 'package:adigym/screeens/calendar/ui/widgets/neu_noname_widget.dart';
import 'package:adigym/screeens/calendar/ui/widgets/neu_switch_details.dart';
import 'package:adigym/screeens/calendar/ui/widgets/neu_text_filed.dart';
import 'package:adigym/neumorphic/neu_button.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class AddTaskScreens extends StatefulWidget {
  final Task? task;
  final int? day;
  final int? taskLimit;
  final ScrollController scrollController;
  final String status;

  const AddTaskScreens({
    Key? key,
    required this.day,
    required this.status,
    this.taskLimit,
    required this.scrollController,
    this.task,
  }) : super(key: key);

  @override
  State<AddTaskScreens> createState() => _AddTaskScreensState();
}

class _AddTaskScreensState extends State<AddTaskScreens> {
  final TaskController _taskController = Get.put(TaskController());

  late TextEditingController _nameExercisesController;
  // late double _massaSnarAddTask;
  // double _massaSnarAddTaskMin = 1;
  // double _massaSnarAddTaskMax = 199;

  int _podhod = 3;
  int _povtor = 10;

  int indexScroll = 0;

  bool switchChek = false;

  File? _image;
  Uint8List? _bytes;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    _nameExercisesController = TextEditingController();
    if (widget.status == 'update') {
      switchChek = true;
      _nameExercisesController.text = widget.task?.title ?? '';
      _podhod = widget.task?.podhod ?? 0;
      _povtor = widget.task?.povtor ?? 0;
      // _massaSnarAddTask =
      //     (massa_snar_add_task_max + massa_snar_add_task_min) / 2;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameExercisesController.dispose();
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            actionsPadding: EdgeInsets.symmetric(vertical: 56, horizontal: 36),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeuButton(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(16),
                    padding: const EdgeInsets.all(16),
                    onTap: () {
                      pickImage(ImageSource.camera);
                      Get.back();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_enhance_outlined,
                          size: 60,
                          color: boxColor3,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Камера',
                          style: sub2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  NeuButton(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(16),
                    padding: const EdgeInsets.all(16),
                    onTap: () {
                      pickImage(ImageSource.gallery);
                      Get.back();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.collections_outlined,
                          size: 60,
                          color: boxColor3,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Галерея',
                          style: sub2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }

  Future pickImage(ImageSource source) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      setState(() {
        loading = true;
      });
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile == null) return null;

      setState(() => _image = File(pickedFile.path));
      _bytes = _image!.readAsBytesSync();
    } on PlatformException catch (e) {
      print('Не удалось выбрать изображение: $e');
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OpScaffold(
      appBarText: widget.status == 'add' ? 'Добавление' : 'Обновление',
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 50, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NeuTextFiled(
                hint: 'Название упражнения',
                controller: _nameExercisesController,
                autofocus: widget.status == 'add' ? true : false,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: _showDialog,
                    child: ClayContainer(
                      height: 150,
                      color: boxColor,
                      borderRadius: 16,
                      depth: 15, //_image != null ? 15 : -15,
                      child: loading
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade200,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(color: white),
                                ),
                              ),
                            )
                          : _image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.memory(
                                    _bytes!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Icon(
                                  Icons.camera_alt_rounded,
                                  size: 80,
                                  color: boxColor3,
                                ),
                    ),
                  )),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    height: 150,
                    //width: 100,
                    child: SwitchDetailsWidget(
                      title: 'Добавить\nподробней?',
                      child: NeumorphicSwitch(
                        value: switchChek,
                        style: NeumorphicSwitchStyle(),
                        onChanged: (value) {
                          setState(() {
                            FocusManager.instance.primaryFocus?.unfocus();
                            switchChek = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: switchChek,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: NeuNonameWidget(
                            title: 'Подход',
                            count: _podhod,
                            onTapMinus: () {
                              setState(() {
                                if (_podhod > 1) {
                                  _podhod--;
                                }
                              });
                            },
                            onTapPlus: () {
                              setState(() {
                                if (_podhod < 10) {
                                  _podhod++;
                                }
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: NeuNonameWidget(
                            title: 'Повторения',
                            count: _povtor,
                            onTapMinus: () {
                              setState(() {
                                if (_povtor > 1) {
                                  _povtor--;
                                }
                              });
                            },
                            onTapPlus: () {
                              setState(() {
                                if (_povtor < 30) {
                                  _povtor++;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    NeuMassSnarWidhet(
                      title: 'Масса старяда',
                      index: indexScroll,
                      taskLimitChanged: (val) =>
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                        indexScroll = val ?? 0;
                      }),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 100,
              // ),
            ],
          ),
        ),
      ),
      floatingActionOnTapButton:
          widget.status == 'add' ? _validateDate : _updateDate,
      floatingActionButtonText:
          widget.status == 'add' ? 'Добавить' : 'Обновить',
    );
  }

  _validateDate() {
    if (_nameExercisesController.text.isNotEmpty) {
      int aaa = widget.taskLimit ?? 0;
      if (aaa >= 15) {
        Get.snackbar("Ограничение",
            "В этот день недели можно можно добавить не более 15 упражнений",
            margin: EdgeInsets.all(16),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
            colorText: Colors.black87,
            icon: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
            ));
      } else {
        _addTaskToDb();
        Get.back();
        widget.scrollController.animateTo(
          widget.scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
        );
      }
    } else if (_nameExercisesController.text.isEmpty ||
        _nameExercisesController.text == '\n') {
      Get.snackbar("Ошибка", "Введите название упражнения",
          margin: EdgeInsets.all(16),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
          colorText: Colors.black87,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  _updateDate() async {
    await _taskController.updateTask(Task(
      id: widget.task?.id,
      title: _nameExercisesController.text.replaceAll('\n', ''),
      podhod: switchChek == false ? 0 : _podhod,
      povtor: switchChek == false ? 0 : _povtor,
      masStaryad: switchChek == false ? 0 : indexScroll + 1,
      dayWeek: widget.day,
      exerciseStatus: ExerciseStatus.exerActive,
      photo: _bytes,
    ));
    _taskController.getTask();
    Get.back();
  }

  _addTaskToDb() async {
    await _taskController.addTask(
        task: Task(
      title: _nameExercisesController.text.replaceAll('\n', ''),
      podhod: switchChek == false ? 0 : _podhod,
      povtor: switchChek == false ? 0 : _povtor,
      masStaryad: switchChek == false ? 0 : indexScroll + 1,
      dayWeek: widget.day,
      exerciseStatus: ExerciseStatus.exerActive,
      photo: _bytes,
    ));
  }
}
