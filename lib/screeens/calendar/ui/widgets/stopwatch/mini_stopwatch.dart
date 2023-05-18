import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_conainer.dart';
import 'package:adigym/neumorphic/neu_flo_act_button.dart.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class MiniStopwatch extends StatefulWidget {
  const MiniStopwatch({Key? key}) : super(key: key);

  @override
  State<MiniStopwatch> createState() => _MiniStopwatchState();
}

class _MiniStopwatchState extends State<MiniStopwatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); // Create instance.
  bool _isRunning = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return NeuContainer(
      height: 200,
      width: 150,
      color: boxColor,
      borderRadius: 16,
      padding: const EdgeInsets.all(10),
      depth: 25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              'Секундомер',
              style: sub2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: 0,
              builder: (context, snap) {
                final value = snap.data;
                final displayTime = StopWatchTimer.getDisplayTime(
                  value ?? 0,
                  hours: false,
                  milliSecond: false,
                  minute: value! < 60000 ? false : true,
                );
                return Center(
                  child: Text(
                    displayTime,
                    style: value < 60000
                        ? stopWatchStyleSecond
                        : stopWatchStyleMinute,
                  ),
                );
              }),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NeuFloatingActionButton(
                onTap: () {
                  setState(() {
                    _isRunning = false;
                  });
                  _stopWatchTimer.onResetTimer();
                },
                child: Center(
                    child: Icon(Icons.restart_alt_outlined,
                        size: 38, color: Colors.grey)),
              ),
              NeuFloatingActionButton(
                onTap: () {
                  setState(() {
                    _isRunning = !_isRunning;
                  });
                  _isRunning == true
                      ? _stopWatchTimer.onStartTimer()
                      : _stopWatchTimer.onStopTimer();
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
      ),
    );
  }
}
