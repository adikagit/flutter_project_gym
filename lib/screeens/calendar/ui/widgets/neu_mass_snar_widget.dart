import 'package:adigym/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeuMassSnarWidhet extends StatefulWidget {
  final String title;
  final int index;
  final ValueChanged taskLimitChanged;
  const NeuMassSnarWidhet(
      {Key? key, required this.title, required this.index, required this.taskLimitChanged})
      : super(key: key);

  @override
  State<NeuMassSnarWidhet> createState() => _NeuMassSnarWidhetState();
}

class _NeuMassSnarWidhetState extends State<NeuMassSnarWidhet> {
  late int _index;
  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 122,
        child: Neumorphic(
          style: NeumorphicStyle(
              color: boxColor,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: sub3,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: ListWheelScrollView(
                      physics: FixedExtentScrollPhysics(),
                      itemExtent: 64,
                      useMagnifier: true,
                      magnification: 1.1,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _index = index;
                          widget.taskLimitChanged(_index);
                        });
                        
                        //item = items[index];
                      },
                      children: List.generate(100, (index) {
                        final isSelected = _index == index;
                        final isSelected2 = _index == index + 1;
                        final isSelected3 = _index == index - 1;
                        final style = isSelected
                            ? TextStyle(fontSize: 35) // Colors.blue
                            : isSelected2
                                ? TextStyle(
                                    fontSize: 28, color: Colors.grey[700])
                                : isSelected3
                                    ? TextStyle(
                                        fontSize: 27, color: Colors.grey[700])
                                    : TextStyle(
                                        fontSize: 21, color: Colors.grey);
                        return Center(
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: style, //TextStyle(color: color),
                                ),
                              )),
                        );
                      }),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 3,
                    width: 32,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ));
  
  }
}
