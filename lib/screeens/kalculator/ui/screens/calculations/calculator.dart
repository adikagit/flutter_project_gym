import 'package:adigym/const.dart';
import 'package:adigym/neumorphic/neu_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CalculatorScreens extends StatefulWidget {
  const CalculatorScreens({Key? key}) : super(key: key);

  @override
  _CalculatorScreensState createState() => _CalculatorScreensState();
}

class _CalculatorScreensState extends State<CalculatorScreens> {
  late TextEditingController _massaController;
  late TextEditingController _povtorController;

  late double result;
  late double massa;
  late double povtor;

  @override
  void initState() {
    super.initState();
    _massaController = TextEditingController();
    _povtorController = TextEditingController();

    result = 0;
    massa = 0;
    povtor = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _massaController.dispose();
    _povtorController.dispose();
  }

  void resultClass() {
    setState(() {
      result = (massa * (1 + povtor / 30));
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
          "Макс. вес на 1 раз",
          style: sub1,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8),
                            child: Text(
                              "Масса",
                              style: sub2,
                            ),
                          ),
                          Neumorphic(
                            margin: EdgeInsets.only(
                                left: 8, right: 8, top: 2, bottom: 4),
                            style: NeumorphicStyle(
                              color: boxColor2,
                              depth: NeumorphicTheme.embossDepth(context),
                              boxShape: NeumorphicBoxShape.stadium(),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 18),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(() => massa = 0);
                                } else {
                                  setState(() {
                                    massa = double.parse(value);
                                  });
                                }
                              },
                              cursorColor: Colors.grey[600],
                              controller: _massaController,
                              style: sub3,
                              decoration: InputDecoration.collapsed(
                                hintText: "${0}",
                                hintStyle: sub3,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8),
                            child: Text(
                              "Повторений",
                              style: sub2,
                            ),
                          ),
                          Neumorphic(
                            margin: EdgeInsets.only(
                                left: 8, right: 8, top: 2, bottom: 4),
                            style: NeumorphicStyle(
                              color: boxColor2,
                              depth: NeumorphicTheme.embossDepth(context),
                              boxShape: NeumorphicBoxShape.stadium(),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 18),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(() => povtor = 0);
                                } else {
                                  setState(() {
                                    povtor = double.parse(value);
                                  });
                                }
                              },
                              cursorColor: Colors.grey[600],
                              controller: _povtorController,
                              style: sub3,
                              decoration: InputDecoration.collapsed(
                                hintText: "${0}",
                                hintStyle: sub3,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              NeuButton(
                color: boxColor2,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                onTap: resultClass,
                child: Text(
                  "Расчитать",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              NeumorphicText(
                result.toStringAsFixed(1),
                style: NeumorphicStyle(
                  depth: 4,
                  color: Colors.black.withOpacity(0.65),
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 50,
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
