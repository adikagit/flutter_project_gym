// import 'package:adigym/const.dart';
// import 'package:adigym/neumorphic/neu_button.dart';
// import 'package:adigym/screeens/calendar/ui/screens/addtask.dart';
// import 'package:adigym/screeens/calendar/ui/widgets/neu_play_button.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:adigym/screeens/calendar/logic/controllers/task_controllers.dart';
// import 'package:get/get.dart';
// import 'package:neon_circular_timer/neon_circular_timer.dart';

// class Sekundomer extends StatefulWidget {
//   final String? title;
//   final int? podhod;
//   final int? povtor;
//   final int? massaSnar;
//   final int? deleteTask;
//   final int? dayWeek;
//   final ScrollController scrollController;
//   final int? idTask;
//   final String? exerciseStatus;
//   final Uint8List? image;
//   const Sekundomer(
//       {Key? key,
//       required this.title,
//       required this.podhod,
//       required this.povtor,
//       required this.massaSnar,
//       required this.deleteTask,
//       this.dayWeek,
//       required this.scrollController,
//       this.idTask,
//       required this.exerciseStatus,
//       this.image})
//       : super(key: key);

//   @override
//   State<Sekundomer> createState() => _SekundomerState();
// }

// class _SekundomerState extends State<Sekundomer> {
//   final TaskController _taskController = Get.put(TaskController());
//   final CountDownController _timerController = CountDownController();
//   int sec = 5;

//   bool _secChek = false;

//   void _showDialog() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             actionsAlignment: MainAxisAlignment.spaceAround,
//             actionsPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             actions: [
//               Container(
//                 height: 400,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Color.fromARGB(255, 242, 246, 252),
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 15,
//                         offset: Offset(-5, -5),
//                         color: white,
//                       ),
//                       BoxShadow(
//                         blurRadius: 15,
//                         offset: Offset(10.5, 10.5),
//                         color: Color.fromRGBO(214, 223, 230, 1),
//                       ),
//                     ],
//                     border: Border.all(
//                       width: 15,
//                       color: boxColor,
//                     )),
//                 child: Stack(
//                   children: <Widget>[
//                     NeonCircularTimer(
//                       onComplete: () {
//                         HapticFeedback.vibrate();
//                         _timerController.start();
//                       },
//                       //initialDuration: 4,
//                       width: 250,
//                       duration: sec,
//                       controller: _timerController,
//                       isTimerTextShown: false,
//                       neumorphicEffect: false,
//                       autoStart: false,
//                       strokeWidth: 70,
//                       strokeCap: StrokeCap.round,
//                       innerFillGradient: LinearGradient(colors: [
//                         Colors.greenAccent.shade200,
//                         Colors.blueAccent.shade400
//                       ]),
//                       neonGradient: LinearGradient(colors: [
//                         Colors.greenAccent.shade200,
//                         Colors.blueAccent.shade400
//                       ]),
//                     ),
//                     Center(
//                       child: Container(
//                         height: 190,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               width: 15,
//                               color: boxColor,
//                             )),
//                         child: NeuPlayButton(timerController: _timerController),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: showColor,
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 margin: EdgeInsets.only(top: 12),
//                 width: 30,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.black26,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                   child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     widget.title ?? '',
//                     style: TextStyle(fontSize: 22),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       widget.podhod != 0
//                           ? Column(
//                               children: [
//                                 Text(
//                                   'Подход',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Text(
//                                   '${widget.podhod ?? 0}',
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                               ],
//                             )
//                           : Container(),
//                       widget.povtor != 0
//                           ? Column(
//                               children: [
//                                 Text(
//                                   'Повтооений',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Text(
//                                   '${widget.povtor ?? 0}',
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                               ],
//                             )
//                           : Container(),
//                       widget.massaSnar != 0
//                           ? Column(
//                               children: [
//                                 Text(
//                                   'Масса',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Text(
//                                   '${widget.massaSnar ?? 0}',
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                               ],
//                             )
//                           : Container(),
//                     ],
//                   ),
//                   Stack(alignment: Alignment.bottomCenter, children: [
//                     Container(
//                       height: 350,
//                       width: MediaQuery.of(context).size.width,
//                       //color: blue,
//                       child: widget.image != null
//                           ? ClipRRect(
//                               borderRadius: BorderRadius.circular(16),
//                               child: Image.memory(
//                                 widget.image!,
//                                 fit: BoxFit.fill,
//                               ),
//                             )
//                           : Container(),
//                     ),
//                     AnimatedContainer(
//                       duration: Duration(milliseconds: 200),
//                       height: _secChek == false ? 0 : 350,
//                       color: showColor,
//                       child: Column(
//                         children: [
//                           Flexible(
//                             flex: 3,
//                             child: Container(
//                               height: 300,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Color.fromARGB(255, 242, 246, 252),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       blurRadius: 15,
//                                       offset: Offset(-5, -5),
//                                       color: white,
//                                     ),
//                                     BoxShadow(
//                                       blurRadius: 15,
//                                       offset: Offset(10.5, 10.5),
//                                       color: Color.fromRGBO(214, 223, 230, 1),
//                                     ),
//                                   ],
//                                   border: Border.all(
//                                     width: 15,
//                                     color: boxColor,
//                                   )),
//                               child: NeonCircularTimer(
//                                 onComplete: () {
//                                   HapticFeedback.vibrate();
//                                   _timerController.start();
//                                 },
//                                 textFormat: TextFormat.MM_SS,
//                                 //initialDuration: 4,
//                                 width: 220,
//                                 duration: sec,
//                                 controller: _timerController,
//                                 isTimerTextShown: true,
//                                 neumorphicEffect: false,
//                                 autoStart: false,
//                                 strokeWidth: 35,
//                                 strokeCap: StrokeCap.round,
//                                 innerFillGradient: LinearGradient(colors: [
//                                   Colors.greenAccent.shade200,
//                                   Colors.blueAccent.shade400
//                                 ]),
//                                 neonGradient: LinearGradient(colors: [
//                                   Colors.greenAccent.shade200,
//                                   Colors.blueAccent.shade400
//                                 ]),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Container(
//                                   height: 80,
//                                   child: NeuPlayButton(
//                                       timerController: _timerController),
//                                 ),
//                                 Container(
//                                   height: 80,
//                                   child: NeuPlayButton(
//                                       timerController: _timerController),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
                  
//                   ]),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   NeuButton(
//                       width:
//                           double.infinity, //MediaQuery.of(context).size.width,
//                       padding: EdgeInsets.symmetric(vertical: 18),
//                       color: boxColor,
//                       onTab: () => setState(() => _secChek = !_secChek),
//                       child: Text(
//                         _secChek == false
//                             ? 'Открыть секундомер'
//                             : 'Закрыть секундомер',
//                         textAlign: TextAlign.center,
//                       )),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       NeumorphicFloatingActionButton(
//                         style: NeumorphicStyle(
//                           color: update,
//                           boxShape: NeumorphicBoxShape.circle(),
//                         ),
//                         child: Icon(Icons.create_outlined,
//                             size: 30, color: Colors.black54),
//                         onPressed: () async {
//                           Get.back();
//                           await Get.to(AddTaskScreens(
//                             status: 'update',
//                             idTask: widget.idTask,
//                             day: widget.dayWeek,
//                             scrollController: widget.scrollController,
//                             taskTitle: widget.title,
//                             podhod: widget.podhod,
//                             povtor: widget.povtor,
//                           ));
//                           _taskController.getTask();
//                         },
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       NeumorphicFloatingActionButton(
//                         style: NeumorphicStyle(
//                           color: delete,
//                           boxShape: NeumorphicBoxShape.circle(),
//                         ),
//                         child: Icon(Icons.delete_forever_outlined,
//                             size: 30, color: Colors.black54),
//                         onPressed: () {
//                           _taskController.delete(
//                               _taskController.taskList[widget.deleteTask ?? 0]);
//                           _taskController.getTask();
//                           Get.back();
//                         },
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: NeuButton(
//                           padding: EdgeInsets.symmetric(vertical: 18),
//                           color:
//                               widget.exerciseStatus == ExerciseStatus.exerActive
//                                   ? exerComplColor
//                                   : boxColor,
//                           onTab:
//                               widget.exerciseStatus == ExerciseStatus.exerActive
//                                   ? _updateExerciseCompleted
//                                   : _updateExerciseActive,
//                           child: Text(
//                             widget.exerciseStatus == ExerciseStatus.exerActive
//                                 ? 'Завершить'
//                                 : 'Активировать',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _updateExerciseActive() async {
//     await _taskController.updateTaskRaw(
//       ExerciseStatus.exerActive,
//       widget.idTask ?? 0,
//     );
//     _taskController.getTask();
//     Get.back();
//   }

//   _updateExerciseCompleted() async {
//     await _taskController.updateTaskRaw(
//       ExerciseStatus.exerCompleted,
//       widget.idTask ?? 0,
//     );
//     _taskController.getTask();
//     Get.back();
//   }
// }
