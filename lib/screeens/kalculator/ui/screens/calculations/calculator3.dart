import 'package:adigym/const.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class Calculator3Screens extends StatefulWidget {
  const Calculator3Screens({Key? key}) : super(key: key);

  @override
  _Calculator3ScreensState createState() => _Calculator3ScreensState();
}

class _Calculator3ScreensState extends State<Calculator3Screens> {
  late TextEditingController _massaKolPovtController;
  late TextEditingController _povtorKolPovtController;

  late double _resultKolPovt;
  late double _maxMassaKolPovt;
  late double _massaKolPovt;

  @override
  void initState() {
    super.initState();
    _massaKolPovtController = TextEditingController();
    _povtorKolPovtController = TextEditingController();

    _resultKolPovt = 0;
    _maxMassaKolPovt = 0;
    _massaKolPovt = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _massaKolPovtController.dispose();
    _povtorKolPovtController.dispose();
  }

  void resultClass() {
    setState(() {
      _resultKolPovt =
          (_maxMassaKolPovt - _massaKolPovt) / (_massaKolPovt * 0.033);
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
          "Количество повторений",
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
                                  setState(() => _maxMassaKolPovt = 0);
                                } else {
                                  setState(() {
                                    _maxMassaKolPovt = double.parse(value);
                                  });
                                }
                              },
                              cursorColor: Colors.grey[600],
                              controller: _massaKolPovtController,
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
                              "Вес",
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
                                  setState(() => _massaKolPovt = 0);
                                } else {
                                  setState(() {
                                    _massaKolPovt = double.parse(value);
                                  });
                                }
                              },
                              cursorColor: Colors.grey[600],
                              controller: _povtorKolPovtController,
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
                _resultKolPovt.toStringAsFixed(1),
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
    if (_massaKolPovtController.text.isNotEmpty &&
        _povtorKolPovtController.text.isNotEmpty) {
      // FirebaseFirestore.instance.collection('pn').add({'name': _name});
      // Navigator.pop(context, MaterialPageRoute(builder: (context){return Calendar();}));
    } else if (_massaKolPovtController.text.isEmpty ||
        _povtorKolPovtController.text.isEmpty) {
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
