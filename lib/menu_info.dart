import 'package:clock_app/enum.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType; //MenuType (clock,alarm,timer,stopwatch)
  String title;
  String imageSource;

  MenuInfo(@required this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;


    //Important!!!
    notifyListeners();  //Whenever update then this method will be called
  }
}
