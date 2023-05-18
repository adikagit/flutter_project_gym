// import 'package:adigym/const.dart';
// import 'package:adigym/screeens/kalculator/logic/controllers/personal_controllers.dart';
// import 'package:adigym/screeens/kalculator/ui/widget/neu_calc_result.dart';
// import 'package:adigym/screeens/kalculator/ui/widget/neu_personal_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:hive/hive.dart';

// import 'package:get/get.dart';

// class Tab1 extends StatefulWidget {
//   const Tab1({Key? key}) : super(key: key);

//   @override
//   State<Tab1> createState() => _Tab1State();
// }

// class _Tab1State extends State<Tab1> {
//   final PersonalControllers _personalController =
//       Get.put(PersonalControllers());

//   @override
//   void dispose() {
//     Hive.box('adigym').close();
//     super.dispose();
//   }

//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: boxColor,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Center(
//                   child: Text(
//                    _personalController.personalList.isEmpty ?'Adigym': _personalController.personalList[index].name ?? 'Adigym',
//                     style: sub1,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),

//                 Obx(() {
//                   return Row(
//                     children: [
//                       Expanded(
//                         child: NeuPersonalDataWidget(
//                           title: 'Возраст',
//                           count: _personalController.personalList.isEmpty ?0: double.tryParse(
//                                   '${_personalController.personalList[index].age}') ??
//                               0.0, //22,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Expanded(
//                         child: NeuPersonalDataWidget(
//                           title: 'Вес',
//                           count: _personalController.personalList.isEmpty ?0:double.tryParse(
//                                   '${_personalController.personalList[index].weight}') ??
//                               0.0,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 16,
//                       ),
//                       Expanded(
//                         child: NeuPersonalDataWidget(
//                           title: 'Рост',
//                           count: _personalController.personalList.isEmpty ?0:double.tryParse(
//                                   '${_personalController.personalList[index].height}') ??
//                               0.0,
//                         ),
//                       ),
//                     ],
//                   );
//                 }),

//                 SizedBox(
//                   height: 30,
//                 ),
//                 // ListView.separated(
//                 //     itemCount: 3,
//                 //     separatorBuilder:((context, index) => SizedBox(width: 26,)),
//                 //     itemBuilder: (context, index) {
//                 //       return Row(
//                 //         children: [
//                 //           Expanded(
//                 //             child: NeuPersonalDataWidget(
//                 //               title: 'Возраст',
//                 //               count: _personalController
//                 //                           .personalList.length <=
//                 //                       0
//                 //                   ? 0
//                 //                   : double.tryParse(
//                 //                           '${_personalController.personalList[index].age ?? 0}') ??
//                 //                       0.0, //22,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             width: 16,
//                 //           ),
//                 //           Expanded(
//                 //             child: NeuPersonalDataWidget(
//                 //               title: 'Вес',
//                 //               count: 70,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             width: 16,
//                 //           ),
//                 //           Expanded(
//                 //             child: NeuPersonalDataWidget(
//                 //               title: 'Рост',
//                 //               count: 0,
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       );
//                 //     }),
//                 // SizedBox(
//                 //   height: 30,
//                 // ),
//                 NeuCalcResultWidget(
//                   title: 'Возраст',
//                   count: 22,
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 NeuCalcResultWidget(
//                   title: 'Вес',
//                   count: 70,
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 NeuCalcResultWidget(
//                   title: 'Рост',
//                   count: 0,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }

//   // Future addPersonal(
//   //     int id, String name, int age, int height, int weight) async {
//   //   final personal = Personal()
//   //     ..id = id
//   //     ..name = name
//   //     ..age = age
//   //     ..height = height
//   //     ..weight = weight;

//   //   final box = Boxes.getPersonal();
//   //   box.add(personal);
//   //   //box.put('personal', personal);
//   // }
// }
