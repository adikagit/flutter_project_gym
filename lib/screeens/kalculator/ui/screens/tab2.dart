// import 'package:adigym/const.dart';
// import 'package:adigym/neumorphic/neu_button.dart';
// import 'package:adigym/screeens/kalculator/ui/screens/calculations/calculator.dart';
// import 'package:adigym/screeens/kalculator/ui/screens/calculations/calculator2.dart';
// import 'package:adigym/screeens/kalculator/ui/screens/calculations/calculator3.dart';
// import 'package:adigym/screeens/kalculator/ui/screens/calculations/calculator4.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:get/get.dart';

// class Tab2 extends StatefulWidget {
//   const Tab2({Key? key}) : super(key: key);

//   @override
//   State<Tab2> createState() => _Tab2State();
// }

// class _Tab2State extends State<Tab2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: boxColor,
//       body: GridView.count(
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
//         crossAxisCount: 2,
//         childAspectRatio: .85,
//         crossAxisSpacing: 25,
//         mainAxisSpacing: 25,
//         children: [
//           NeuButton(
//             color: boxColor,
//             onTab: () {
//               Get.to(const CalculatorScreens());
//             },
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/chel.png',
//                   // height: 32,
//                 ),
//                 Text(
//                   "1RM",
//                   style: sub1,
//                 )
//               ],
//             ),
//           ),
//           NeuButton(
//             color: boxColor,
//             onTab: () {
//               Get.to(const Calculator2Screens());
//             },
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/chel.png',
//                   // height: 32,
//                 ),
//                 Text(
//                   "WWC",
//                   style: sub1,
//                 )
//               ],
//             ),
//           ),
//           NeuButton(
//             color: boxColor,
//             onTab: () {
//               Get.to(const Calculator3Screens());
//             },
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/chel.png',
//                   // height: 32,
//                 ),
//                 Text(
//                   "NOR",
//                   style: sub1,
//                 )
//               ],
//             ),
//           ),
//           NeuButton(
//             color: boxColor,
//             onTab: () {
//               Get.to(const Calculator4Screens());
//             },
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/chel.png',
//                   // height: 32,
//                 ),
//                 Text(
//                   "BMI",
//                   style: sub1,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

