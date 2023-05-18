import 'package:adigym/const.dart';
import 'package:adigym/screeens/exerciss/screens/exercisesList/biceps/biceps.dart';
import 'package:adigym/screeens/exerciss/widget/exercissWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Exerciss extends StatefulWidget {
  const Exerciss({Key? key}) : super(key: key);

  @override
  State<Exerciss> createState() => _ExercissState();
}

class _ExercissState extends State<Exerciss> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: boxColor,
      body: GridView.count(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        childAspectRatio: .62,
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 100),
        children: [
          ExercissWidget(image: 'assets/images/chel.png', title: 'Бицепс', onTap: () => Get.to(Biceps()),),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Трицепс', onTap: null,),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Предплечье',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Плечи',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Грудь',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Пресс',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Верхняя спина',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Нижняя спина',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Латы',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Ягодицы и подколенное сухожилие',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Квадрицепс и приводящая мышца',onTap: () {  },),
          ExercissWidget(image: 'assets/images/chel.png', title: 'Икры',onTap: () {  },),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';

// class Exerciss extends StatefulWidget {
//   const Exerciss({Key? key,}) : super(key: key);

//   @override
//   _ExercissState createState() => _ExercissState();
// }

// class _ExercissState extends State<Exerciss>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(vsync: this, length: 7);
//     super.initState();
//   }

//   Widget _pageView(int index) {
//     return ListView.builder(
//       itemExtent: 100,//размер
//       itemCount: 10,//количество
//       itemBuilder: (context, i) => Card(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Center(child: Text('Tab ${index + 1} - item no $i')),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("widget.title"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ColorfulTabBar(
//               indicatorHeight: 2,
//               verticalTabPadding: 4.5,
//               labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               selectedHeight: 53,
//               unselectedHeight: 43,
//               labelColor: Colors.white,
//               unselectedLabelColor: Colors.white30,
//               //selectedHeight: 64,
//               //unselectedHeight: 48,
//               tabs: [
//                 TabItem(
//                     title: Text('Пн'),
//                     color: Colors.blue.shade600,
//                     unselectedColor: Colors.blue.shade400),
//                 TabItem(
//                     title: Text('Вт'),
//                     color: Colors.blue.shade600,
//                     unselectedColor: Colors.blue.shade400),
//                 TabItem(
//                     title: Text('Ср'),
//                     color: Colors.blue.shade600,
//                     unselectedColor: Colors.blue.shade400),
//                 TabItem(
//                     title: Text('Чт'),
//                     color: Colors.blue.shade600,
//                     unselectedColor: Colors.blue.shade400),
//                 TabItem(
//                     title: Text('Пт'),
//                     color: Colors.blue.shade600,
//                     unselectedColor: Colors.blue.shade400),
//                 TabItem(
//                     title: Text('Сб'),
//                     color: Colors.blue.shade600,
//                     unselectedColor: Colors.blue.shade400),
//                 TabItem(
//                     title: Text('Вс'),
//                     color: Colors.blue.shade600,
//                     unselectedColor: Colors.blue.shade400),
//               ],
//               controller: _tabController,
//             ),
//             Expanded(
//               child: TabBarView(
//                   controller: _tabController,
//                   children: List.generate(7, (index) => _pageView(index))),
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
     
//     );
  
//   }
// }