import 'package:adigym/screeens/exerciss/screens/exerciss.dart';
import 'package:adigym/screeens/calendar/ui/screens/1calendar.dart';
import 'package:adigym/screeens/kalculator/ui/screens/calculator_home.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectindex = 0;

  final List<Widget> _tabList = [
    const Calendar(),
    const Exerciss(),
    const CalculatorHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SafeArea(child: _tabList.elementAt(selectindex)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 84,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  navigation.length,
                  (index) => nav(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nav(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectindex = index;
          });
        },
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: kbox,
          ),
          child: selectindex == index
              ? Container(
                  height: 59,
                  width: 59,
                  decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: kIShadow),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        navigation[index].icon,
                        height: 32,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(navigation[index].title,
                          style: TextStyle(color: Colors.blue, fontSize: 10)),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      navigation[index].icon,
                      height: 30,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(navigation[index].title,
                        style: TextStyle(color: Colors.grey, fontSize: 9)),
                  ],
                ),
        ),
      );
}
