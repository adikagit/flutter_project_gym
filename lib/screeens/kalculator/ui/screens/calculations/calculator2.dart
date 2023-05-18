import 'package:adigym/const.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class Calculator2Screens extends StatefulWidget {
  const Calculator2Screens({Key? key}) : super(key: key);

  @override
  _Calculator2ScreensState createState() => _Calculator2ScreensState();
}

class _Calculator2ScreensState extends State<Calculator2Screens> {
  late TextEditingController _massaRabVesController;
  late TextEditingController _povtorRabVesController;

  late double _resultRabVes;
  late double _maxMassaRabVes;
  late double _povtorRabVes;

  @override
  void initState() {
    super.initState();
    _massaRabVesController = TextEditingController();
    _povtorRabVesController = TextEditingController();

    _resultRabVes = 0;
    _maxMassaRabVes = 0;
    _povtorRabVes = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _massaRabVesController.dispose();
    _povtorRabVesController.dispose();
  }

  void resultClass() {
    setState(() {
      _resultRabVes = (1.0278 - (0.0278 * _povtorRabVes)) * _maxMassaRabVes;
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
          "Рабочий вес",
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
                              "Макс. вес",
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
                                  setState(() => _maxMassaRabVes = 0);
                                } else {
                                  setState(() {
                                    _maxMassaRabVes = double.parse(value);
                                  });
                                }
                              },
                              cursorColor: Colors.grey[600],
                              controller: _massaRabVesController,
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
                                  setState(() => _povtorRabVes = 0);
                                } else {
                                  setState(() {
                                    _povtorRabVes = double.parse(value);
                                  });
                                }
                              },
                              cursorColor: Colors.grey[600],
                              controller: _povtorRabVesController,
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
                _resultRabVes.toStringAsFixed(1),
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

  _validateDate() {
    if (_massaRabVesController.text.isNotEmpty &&
        _povtorRabVesController.text.isNotEmpty) {
      // FirebaseFirestore.instance.collection('pn').add({'name': _name});
      // Navigator.pop(context, MaterialPageRoute(builder: (context){return Calendar();}));
    } else if (_massaRabVesController.text.isEmpty ||
        _povtorRabVesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        padding: EdgeInsets.only(left: 15, right: 15),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.error_outline,
              size: 32,
              color: Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                "Введите поля",
                style: TextStyle(fontSize: 19),
              ),
            )
          ],
        ),
        backgroundColor: Colors.red,
        //behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
