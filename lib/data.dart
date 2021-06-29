import 'package:clock_app/enum.dart';
import 'package:clock_app/menu_info.dart';
import 'package:clock_app/theme_data.dart';

import 'alarm_info.dart';

List<MenuInfo> menuItems = [  // Provide all the images and all other parameter which we create in  MenuInfo
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'StopWatch', imageSource: 'assets/stopwatch_icon.png'),
];


List<AlarmInfo> alarms = [
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 1)),
      title: 'Office',
      gradientColorIndex: 0),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(Duration(hours: 2)),
      title: 'Sport',
      gradientColorIndex: 1),
];
