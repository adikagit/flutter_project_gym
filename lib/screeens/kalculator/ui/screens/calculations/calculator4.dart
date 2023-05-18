import 'dart:math';
import 'package:adigym/const.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class Calculator4Screens extends StatefulWidget {
  const Calculator4Screens({Key? key}) : super(key: key);

  @override
  _Calculator4ScreensState createState() => _Calculator4ScreensState();
}

class _Calculator4ScreensState extends State<Calculator4Screens> {
  late TextEditingController _rostController;
  late TextEditingController _massaController;

  late double result;

  late double rost;
  late double massa;

  late double _rostMin;
  late double _rostMax;

  late double _massaMin;
  late double _massaMax;

  String? itog = "";

  @override
  void initState() {
    super.initState();

    _rostController = TextEditingController();
    _massaController = TextEditingController();

    result = 0;
    rost = (_rostMax + _rostMin) / 2;
    massa = (_massaMax + _massaMin) / 2;
    _rostMin = 100;
    _rostMax = 220;
    _massaMin = 30;
    _massaMax = 120;
  }

  @override
  void dispose() {
    super.dispose();
    _rostController.dispose();
    _massaController.dispose();
  }

  void resultClass() {
    setState(() {
      result = (massa / pow((rost / 100), 2));
      if (result <= 18.4) {
        itog = "Дефицит массы тела";
      } else if (result > 18.4 && result <= 25) {
        itog = "Норма";
      } else if (result > 25 && result <= 30) {
        itog = "Предожирение";
      } else if (result > 30 && result <= 34.9) {
        itog = "Ожирение 1 степени";
      } else if (result > 34.9 && result <= 40) {
        itog = "Ожирение 2 степени";
      } else if (result > 40) {
        itog = "Ожирение 3 степени";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boxColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: boxColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios, size: 25, color: Colors.grey),
        ),
        title: Text(
          "Индекс массы тела",
          style: sub1,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Neumorphic(
                  style: NeumorphicStyle(
                      color: boxColor,
                      // boxShape:NeumorphicBoxShape.beveled(BorderRadius.circular(20))
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 10, bottom: 15),
                    child: Column(
                      children: [
                        Text(
                          "Масса снаряда",
                          style: sub2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${rost.round()}",
                          style: TextStyle(fontSize: 35),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        NeumorphicSlider(
                          value: rost,
                          min: _rostMin,
                          max: _rostMax,
                          height: 11,
                          onChanged: (value) => setState(
                            () => this.rost = value,
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Neumorphic(
                  style: NeumorphicStyle(
                      color: boxColor,
                      // boxShape:NeumorphicBoxShape.beveled(BorderRadius.circular(20))
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, top: 10, bottom: 15),
                    child: Column(
                      children: [
                        Text(
                          "Масса снаряда",
                          style: sub2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${massa.round()}",
                          style: TextStyle(fontSize: 35),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        NeumorphicSlider(
                          value: massa,
                          min: _massaMin,
                          max: _massaMax,
                          height: 11,
                          onChanged: (value) => setState(
                            () => this.massa = value,
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                color: boxColor,
                child: NeumorphicButton(
                  style: NeumorphicStyle(
                    color: boxColor2,
                  ),
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                  onPressed: resultClass,
                  child: Text(
                    "Расчитать",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              NeumorphicText(
                result.toStringAsFixed(2),
                style: NeumorphicStyle(
                  depth: 4,
                  color: Colors.black.withOpacity(0.65),
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              NeumorphicText(
                '${itog}',
                style: NeumorphicStyle(
                  depth: 4,
                  color: Colors.black.withOpacity(0.65),
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _validateDate() {
  //   if (_massaController.text.isNotEmpty && _povtorController.text.isNotEmpty) {
  //     // FirebaseFirestore.instance.collection('pn').add({'name': _name});
  //     // Navigator.pop(context, MaterialPageRoute(builder: (context){return Calendar();}));
  //   } else if (_massaController.text.isEmpty ||
  //       _povtorController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       padding: EdgeInsets.only(left: 15, right: 15),
  //       content: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Icon(
  //             Icons.error_outline,
  //             size: 32,
  //             color: Colors.white,
  //           ),
  //           SizedBox(
  //             width: 16,
  //           ),
  //           Expanded(
  //             child: Text(
  //               "Введите поля",
  //               style: TextStyle(fontSize: 19),
  //             ),
  //           )
  //         ],
  //       ),
  //       backgroundColor: Colors.red,
  //       //behavior: SnackBarBehavior.floating,
  //     ));
  //   }
  // }

}
