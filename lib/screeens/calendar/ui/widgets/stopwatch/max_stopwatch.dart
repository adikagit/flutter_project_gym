import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_flo_act_button.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class MaxStopwatch extends StatefulWidget {
  const MaxStopwatch({Key? key}) : super(key: key);

  @override
  State<MaxStopwatch> createState() => _MaxStopwatchState();
}

class _MaxStopwatchState extends State<MaxStopwatch> {
  final CountDownController _timerController = CountDownController();
  int sec = 5;
  bool _isRunning = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            NeuFloatingActionButton(
                onTap: () {},
                child: Icon(
                  Icons.access_time_outlined,
                  size: 38,
                  color: Colors.grey,
                )),
            SizedBox(
              height: 15,
            ),
            NeuFloatingActionButton(
                onTap: () {},
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 38,
                  color: Colors.grey,
                )),
          ],
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            //height: 300,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 242, 246, 252),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(-5, -5),
                    color: white,
                  ),
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10.5, 10.5),
                    color: Color.fromRGBO(214, 223, 230, 1),
                  ),
                ],
                border: Border.all(
                  width: 15,
                  color: boxColor,
                )),
            child: NeonCircularTimer(
              onComplete: () {
                HapticFeedback.vibrate();
                _timerController.start();
              },
              textFormat: TextFormat.MM_SS,
              //initialDuration: 4,
              width: 220,
              duration: sec,
              controller: _timerController,
              isTimerTextShown: true,
              neumorphicEffect: false,
              autoStart: false,
              strokeWidth: 35,
              strokeCap: StrokeCap.round,
              innerFillGradient: LinearGradient(colors: [
                Colors.greenAccent.shade200,
                Colors.blueAccent.shade400
              ]),
              neonGradient: LinearGradient(colors: [
                Colors.greenAccent.shade200,
                Colors.blueAccent.shade400
              ]),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          children: [
            Container(
              height: 70,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            NeuFloatingActionButton(
              onTap: () {
                setState(() {
                  _isRunning = true;
                });
                _timerController.restart();
              },
              child: Center(
                  child: Icon(Icons.restart_alt_outlined,
                      size: 38, color: Colors.grey)),
            ),
            SizedBox(
              height: 15,
            ),
            NeuFloatingActionButton(
              onTap: () {
                setState(() {
                  _isRunning = !_isRunning;
                });
                _isRunning == true
                    ? _timerController.resume()
                    : _timerController.pause();
              },
              child: Center(
                  child: Icon(_isRunning ? Icons.pause : Icons.play_arrow,
                      size: 38,
                      color: _isRunning
                          ? Colors.redAccent.shade400
                          : Colors.greenAccent.shade400)),
            ),
          ],
        ),
      ],
    );
  }
}
