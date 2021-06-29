
import 'package:clock_app/calender_page.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/theme_data.dart';
import 'package:clock_app/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'alarm_page.dart';
import 'clock_page.dart';
import 'data.dart';
import 'menu_info.dart';
import 'stopwatch_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems  //get all the menuItem through map and then called buildMenuButton
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(  //This consumer check which notifyListeners match and according to call them
              builder: (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType == MenuType.clock)
                  return ClockPage();
                else if (value.menuType == MenuType.alarm)
                  return AlarmPage();
                else if (value.menuType == MenuType.stopwatch)
                  return StopwatchPage();
                else
                  return CalenderPage();
                /*else
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: 'Upcoming Tutorial\n'),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );*/
              },
            ),
          ),
        ],
      ),
    );
  }
}
