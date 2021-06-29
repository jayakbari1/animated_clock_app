import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'clockview.dart';
import 'menu_info.dart';
import 'theme_data.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var formattedTime = DateFormat('h:mm a').format(now);  //12 hour time-formate
    var formattedDate = DateFormat('EEE, d MMM').format(now);  //Thu,24 Jun formate
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: CustomColors.primaryTextColor,
                  fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //DigitalClockWidget(),
                Text(
                  formattedTime,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w300,
                      color: CustomColors.primaryTextColor,
                      fontSize: 50),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w300,
                      color: CustomColors.primaryTextColor,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 4,  //draw the clock according to device size
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Timezone',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w500,
                      color: CustomColors.primaryTextColor,
                      fontSize: 24),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.language,
                      color: CustomColors.primaryTextColor,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: CustomColors.primaryTextColor,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildMenuButton(MenuInfo currentMenuInfo) {
  // ignore: missing_required_param
  return Consumer<MenuInfo>(  // Come with menuInfo Object
    builder: (BuildContext context, MenuInfo value, Widget child) {
      return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(32)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        color: currentMenuInfo.menuType == value.menuType  //check if pressed menu is match with current or not
            ? CustomColors.menuBackgroundColor  //If matched then changed color
            : Colors.transparent,
        onPressed: () {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);  // Get the instance of the MenuInfo
          menuInfo.updateMenu(currentMenuInfo);  //Update the menuInfo
        },
        child: Column(
          children: [
            Image.asset(
              currentMenuInfo.imageSource,  //Because this get the full information of the currentMenuInfo
              scale: 1.5,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              currentMenuInfo.title ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'avenir',
              ),
            ),
          ],
        ),
      );
    },
  );
}

