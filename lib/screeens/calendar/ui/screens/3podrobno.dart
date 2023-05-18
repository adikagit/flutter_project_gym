import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_flo_act_button.dart.dart';
import 'package:adigym/neumorphic/neu_button.dart';
import 'package:adigym/screeens/calendar/ui/screens/addtask.dart';
import 'package:adigym/screeens/calendar/ui/widgets/stopwatch/max_stopwatch.dart';
import 'package:adigym/screeens/calendar/ui/widgets/stopwatch/mini_stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:adigym/screeens/calendar/logic/controllers/task_controllers.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:adigym/screeens/calendar/logic/models/task.dart';

class Sekundomer extends StatefulWidget {
  final Task task;
  final int? deleteTask;
  final int? dayWeek;
  final ScrollController scrollController;
  final String? exerciseStatus;
  const Sekundomer({
    Key? key,
    required this.task,
    required this.deleteTask,
    this.dayWeek,
    required this.scrollController,
    required this.exerciseStatus,
  }) : super(key: key);

  @override
  State<Sekundomer> createState() => _SekundomerState();
}

class _SekundomerState extends State<Sekundomer> {
  final TaskController _taskController = Get.put(TaskController());


  bool? _optionsChek = false;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: showColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 12),
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.task.title ?? '',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.task.podhod != 0
                          ? Column(
                              children: [
                                Text(
                                  'Подход',
                                  style: sub3,
                                ),
                                Text(
                                  '${widget.task.podhod ?? 0}',
                                  style: sub1,
                                ),
                              ],
                            )
                          : Container(),
                      widget.task.povtor != 0
                          ? Column(
                              children: [
                                Text(
                                  'Повторений',
                                  style: sub3,
                                ),
                                Text(
                                  '${widget.task.povtor ?? 0}',
                                  style: sub1,
                                ),
                              ],
                            )
                          : Container(),
                      widget.task.masStaryad != 0
                          ? Column(
                              children: [
                                Text(
                                  'Масса',
                                  style: sub3,
                                ),
                                Text(
                                  '${widget.task.masStaryad ?? 0}',
                                  style: sub1,
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widget.task.photo != null
                      ? Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FullScreenWidget(
                                disposeLevel: DisposeLevel.High,
                                child: Hero(
                                  tag: 'adigym',
                                  child: SizedBox(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    child: widget.task.photo != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            child: Image.memory(
                                              widget.task.photo!,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MiniStopwatch(),
                          ],
                        )
                      : MaxStopwatch(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 250),
                          left: _optionsChek == false ? 0 : 136,
                          child: NeuFloatingActionButton(
                            color: delete,
                            child: Icon(Icons.delete_forever_outlined,
                                size: 30, color: Colors.black54),
                            onTap: () {
                              _taskController.delete(_taskController
                                  .taskList[widget.deleteTask ?? 0]);
                              _taskController.getTask();
                              Get.back();
                            },
                          ),
                        ),
                        AnimatedPositioned(
                          left: _optionsChek == false ? 0 : 68,
                          duration: Duration(milliseconds: 250),
                          child: NeuFloatingActionButton(
                            child: Icon(Icons.create_outlined,
                                size: 30, color: Colors.black54),
                            onTap: () async {
                              Get.back();
                              await Get.to(AddTaskScreens(
                                task: widget.task,
                                status: 'update',
                                day: widget.dayWeek,
                                scrollController: widget.scrollController,
                              ));
                              _taskController.getTask();
                            },
                          ),
                        ),
                        NeuFloatingActionButton(
                          onTap: () =>
                              setState(() => _optionsChek = !_optionsChek!),
                          child: _optionsChek == false
                              ? Icon(Icons.drag_indicator_outlined,
                                  size: 30, color: Colors.black54)
                              : Icon(Icons.arrow_back_ios_new_outlined,
                                  size: 30, color: Colors.black54),
                        ),
                        AnimatedPadding(
                          duration: Duration(milliseconds: 250),
                          padding: EdgeInsets.only(
                              left: _optionsChek == false ? 70 : 205),
                          child: NeuButton(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            color: widget.exerciseStatus ==
                                    ExerciseStatus.exerActive
                                ? exerComplColor
                                : boxColor,
                            onTap: widget.exerciseStatus ==
                                    ExerciseStatus.exerActive
                                ? _updateExerciseCompleted
                                : _updateExerciseActive,
                            child: Text(
                              widget.exerciseStatus == ExerciseStatus.exerActive
                                  ? 'Завершить'
                                  : 'Активировать',
                              // style: sub3,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  _updateExerciseActive() async {
    await _taskController.updateTaskRaw(
      ExerciseStatus.exerActive,
      widget.task.id ?? 0,
    );
    _taskController.getTask();
    Get.back();
  }

  _updateExerciseCompleted() async {
    await _taskController.updateTaskRaw(
      ExerciseStatus.exerCompleted,
      widget.task.id ?? 0,
    );
    _taskController.getTask();
    Get.back();
  }
}
