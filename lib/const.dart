import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color boxColor = Color(0xFFEFF3FF);
Color boxColor2 = Color(0xFFE5EAFF);
Color boxColor3 = Color.fromARGB(255, 168, 171, 185);
Color update = Color.fromARGB(255, 220, 229, 255);
Color delete = Color.fromARGB(255, 255, 219, 219);

Color complete = Color.fromARGB(255, 255, 116, 116);
Color exerComplColor = Color.fromARGB(255, 250, 230, 230);

Color white = Colors.white;
Color black = Colors.black;
const double appPadding = 30.0;

Color green = Color(0xff6ed268);
Color blue = Color(0xFF5F89FF);
Color yellow = Color(0xFFD1DC33);
Color red = Color(0xFFFF5151);

Color showColor = Color.fromARGB(250, 250, 250, 250);//Color(0xfafafafa);

Color blueWeekDay = Color.fromARGB(255, 128, 162, 255);

final kIShadow = [
  BoxShadow(
      color: Colors.black.withOpacity(.15),
      //blurRadius: 1,
      spreadRadius: 2,
      offset: Offset(-1, 1)),
  BoxShadow(
      color: Colors.white.withOpacity(.7),
      //blurRadius: 1,
      spreadRadius: 2,
      offset: Offset(1, -1)),
  BoxShadow(
      color: Colors.black.withOpacity(.15),
      //blurRadius: 1,
      spreadRadius: 2,
      offset: Offset(-1, -1)),
  BoxShadow(
      color: Colors.white.withOpacity(.7),
      //blurRadius: 1,
      spreadRadius: 2,
      offset: Offset(1, -1)),
];

final kbox = [
  //BoxShadow(color: Colors.white, offset: Offset(-10, -10), blurRadius: 10),
  BoxShadow(
      color: Colors.black.withOpacity(.15),
      offset: Offset(4, 4),
      blurRadius: 15)
];

class Navigation {
  final String icon, title;
  Navigation({required this.icon, required this.title});
}

List<Navigation> navigation = [
  Navigation(
      title: "Календарь", icon: "assets/images/calendar.png"), //Календарь
  Navigation(
      title: "Упражнения", icon: "assets/images/Exerciss.png"), //упражнения
  Navigation(title: "Калькулятор", icon: "assets/images/Calculator.png"),
  //Navigation(title: "Секундомер", icon: "assets/images/chel.png"),
];

class DaysWeek {
  String? title;
  int? groupValue;
  int? animateTo;
  DaysWeek(
      {required this.title, required this.groupValue, required this.animateTo});
}

List<DaysWeek> daysWeek = [
  DaysWeek(
    title: 'Пн',
    groupValue: 1,
    animateTo: 0,
  ),
  DaysWeek(
    title: 'Вт',
    groupValue: 2,
    animateTo: 1,
  ),
  DaysWeek(
    title: 'Ср',
    groupValue: 3,
    animateTo: 2,
  ),
  DaysWeek(
    title: 'Чт',
    groupValue: 4,
    animateTo: 3,
  ),
  DaysWeek(
    title: 'Пт',
    groupValue: 5,
    animateTo: 4,
  ),
  DaysWeek(
    title: 'Сб',
    groupValue: 6,
    animateTo: 5,
  ),
  DaysWeek(
    title: 'Вс',
    groupValue: 7,
    animateTo: 6,
  )
];

class AppBarNavigation {
  final String value, text;
  AppBarNavigation({required this.value, required this.text});
}

List<AppBarNavigation> appbar = [
  AppBarNavigation(value: "A", text: "Пн"), //Календарь
  AppBarNavigation(value: "B", text: "Вт"), //упражнения
  AppBarNavigation(value: "C", text: "Ср"),
  AppBarNavigation(value: "D", text: "Чт"),
  AppBarNavigation(value: "E", text: "Пт"),
  AppBarNavigation(value: "F", text: "Сб"),
  AppBarNavigation(value: "J", text: "Вс"),
];

// class TodayActivity{
//   final String icon,title,count;

//   TodayActivity({required this.icon,required this.title,required this.count});
// }

// List<TodayActivity> today = [
//   TodayActivity(
//     icon:"assets/images/dumbbell.png",
//     title:"Stapes",
//     count:"1,234",
//   ),
//   TodayActivity(
//     icon:"assets/images/dumbbell.png",
//     title:"Colories",
//     count:"826",
//   ),
//   TodayActivity(
//     icon:"assets/images/dumbbell.png",
//     title:"BPM",
//     count:"87.0",
//   )
// ];

TextStyle get sub1 {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[700]));
}

TextStyle get sub2 {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey[700]));
}

TextStyle get sub3 {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey[650]));
}

TextStyle get sub4 {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.bold,
      color: boxColor3,
    ),
  );
}

TextStyle get stopWatchStyleMinute {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 38, fontWeight: FontWeight.bold, color: Colors.grey[700]));
}
TextStyle get stopWatchStyleSecond {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: Colors.grey[700]));
}

class ExerciseStatus {
  static const String exerActive = 'active';
  static const String exerCompleted = 'completed';
}
