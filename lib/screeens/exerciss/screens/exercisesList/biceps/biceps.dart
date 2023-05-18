import 'package:adigym/screeens/exerciss/screens/exercisesList/biceps/listValue.dart';
import 'package:adigym/screeens/exerciss/widget/exercissWidget.dart';
import 'package:flutter/material.dart';

class Biceps extends StatefulWidget {
  const Biceps({Key? key}) : super(key: key);

  @override
  State<Biceps> createState() => _BicepsState();
}

class _BicepsState extends State<Biceps> {
  late PageController pageController;
  int pageIndex = 0;
  bool _chek = false;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            controller: pageController,
            itemCount: listofvalue.length,
            onPageChanged: ((value) => setState(() => pageIndex = value)),
            itemBuilder: (context, int index) {
              if (pageIndex == index) {
                _chek = true;
              } else {
                _chek = false;
              }
              return AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  vertical: _chek ? 50 : 60,
                  horizontal: 10,
                ),
                child: ExercissWidget(
                  image: listofvalue[index].imagepath,
                  title: 'Икры',
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
