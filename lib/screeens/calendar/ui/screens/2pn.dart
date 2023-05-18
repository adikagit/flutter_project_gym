import 'package:adigym/const.dart';
import 'package:adigym/screeens/calendar/logic/controllers/task_controllers.dart';
import 'package:adigym/screeens/calendar/logic/models/task.dart';
import 'package:adigym/screeens/calendar/ui/widgets/neu_task_widget.dart';
import 'package:adigym/screeens/calendar/ui/screens/3podrobno.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// typedef void TaskLimit(int? val);
// typedef void ScrollDown(ScrollController val);

class Pn extends StatefulWidget {
  final int? groupValue;
  final ValueChanged taskLimitChanged;
  final ValueChanged scrollDownChanged;
  final int? dayWeek;
  final ScrollController scrollController;
  const Pn(
      {Key? key,
      required this.groupValue,
      required this.taskLimitChanged,
      required this.scrollDownChanged,
      this.dayWeek,
      required this.scrollController})
      : super(key: key);
  @override
  State<Pn> createState() => _PnState();
}

class _PnState extends State<Pn> {
  final _taskController = Get.put(TaskController());
  late ScrollController _controller;
  late int taskLimitCount;

  @override
  void initState() {
    super.initState();
    taskLimitCount = 0;
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_taskController.taskList
          .where((c) => c.dayWeek == widget.groupValue)
          .isEmpty) {
        return Container(
          child: Center(
              child: Text(
            'На сегодня у Вас ничего нет,\nотдыхайте)',
            style: sub4,
            textAlign: TextAlign.center,
          )).paddingOnly(bottom: 70),
        );
      } else {
        return ListView.builder(
          // onReorder: (int oldIndex, int newIndex) {
          //   setState(() {
          //     final index = newIndex > oldIndex ? newIndex - 1 : newIndex + 1;

          //     final item = _taskController.taskList.removeAt(oldIndex);
          //     _taskController.taskList.insert(newIndex, item);
          //   });
          // },
          controller: _controller,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _taskController.taskList.length,
          shrinkWrap: true,

          itemBuilder: (context, index) {
            Task task = _taskController.taskList[index];

            taskLimitCount = _taskController.taskList
                .where((c) => c.dayWeek == widget.groupValue)
                .length;

            if (task.dayWeek == widget.groupValue) {
              widget.taskLimitChanged(taskLimitCount);
              widget.scrollDownChanged(_controller);
              return Container(
                key: ValueKey(task),
                padding: EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 16,
                    bottom: index == _taskController.taskList.length - 1
                        ? 100
                        : 14),
                child: NeuTaskWidget(
                  color: task.exerciseStatus == ExerciseStatus.exerActive
                      ? boxColor
                      : exerComplColor,
                  image: task.photo,
                  title: task.title ?? '',
                  index: index,
                  onTap: () {
                    setState(() {
                      showCupertinoModalBottomSheet(
                       //transitionBackgroundColor: showColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        context: context,
                        builder: (_) {
                          return Wrap(children: [
                            Sekundomer(
                              task:task,
                              scrollController: widget.scrollController,
                              dayWeek: widget.dayWeek,
                              deleteTask: index,
                              exerciseStatus: task.exerciseStatus ?? '',
                            )
                          ]);
                        },
                      );
                    });
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        );
      }
    });
  }
}
