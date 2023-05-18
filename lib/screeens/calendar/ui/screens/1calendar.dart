import 'package:adigym/neumorphic/neu_button.dart';
import 'package:adigym/neumorphic/neu_flo_act_button.dart.dart';
import 'package:adigym/screeens/calendar/ui/screens/test.dart';
import 'package:adigym/screeens/calendar/ui/widgets/week_day_button.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adigym/const.dart';
import 'package:adigym/screeens/calendar/logic/controllers/task_controllers.dart';
import 'package:adigym/screeens/calendar/ui/screens/addtask.dart';
import 'package:adigym/screeens/calendar/ui/screens/2pn.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  late TabController _tabController;
  late int groupValue;
  int? day;
  int? asas = 0;

  DateTime date = DateTime.now();

  final TaskController _taskController = Get.put(TaskController());
  final List<int> _day = [1, 2, 3, 4, 5, 6, 7];
  int? _callback;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    groupValue = date.weekday;
    _tabController =
        TabController(vsync: this, length: 7, initialIndex: groupValue - 1);

    _tabController.addListener(() {
      setState(() {
        groupValue = _tabController.index + 1;
      });
    });

    // _animationController = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 150));

    // _animationController.value = groupValue.toDouble();
    // _animationController.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: daysWeek.length,
      initialIndex: 2,
      child: Scaffold(
        backgroundColor: boxColor,
        body: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClayText("Adigym", emboss: false, size: 20, color: boxColor),
                NeuButton(
                  padding: EdgeInsets.all(0),
                  color: boxColor2,
                  onTap: () {},
                  child: Container(
                      alignment: Alignment.center,
                      width: 25,
                      height: 25,
                      child: Icon(Icons.add, color: Colors.black12)),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 11,
              ).copyWith(left: 11),
              child: Row(
                children: List.generate(daysWeek.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: WeekDayButton(
                      tag: daysWeek[index].groupValue ?? 0,
                      active: groupValue == daysWeek[index].groupValue
                          ? true
                          : false,
                      onChanged: (_) {
                        setState(() {
                          groupValue = daysWeek[index].groupValue ?? 0;
                        });
                        _tabController
                            .animateTo(daysWeek[index].animateTo ?? 0);
                      },
                      child: Text(daysWeek[index].title ?? '',
                          style: TextStyle(
                              fontSize: 18,
                              color: groupValue == daysWeek[index].groupValue
                                  ? blueWeekDay
                                  : Colors.black26)),
                    ),
                  );
                }),
              ),
            ),
            // );},
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: List.generate(_day.length, (index) {
                  return Pn(
                    groupValue: _day[index],
                    dayWeek: _day[_tabController.index],
                    scrollController: _scrollController,
                    taskLimitChanged: (val) =>
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                      _callback = val ?? 0;
                    }),
                    scrollDownChanged: (val) =>
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollController = val;
                    }),
                  );
                })),
          ),
        ]),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 85),
          child: NeuFloatingActionButton(
            child: Icon(Icons.add, size: 30, color: Colors.black12),
            onTap: () async {
              await Get.to(
                  //Confeti()
                  //Test()
                  AddTaskScreens(
                day: _day[_tabController.index],
                taskLimit: _callback ?? 0,
                scrollController: _scrollController,
                status: 'add',
              ));
              _taskController.getTask();
            },
          ),
        ),
      ),
    );
  }
}
