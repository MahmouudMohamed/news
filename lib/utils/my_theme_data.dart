import 'package:flutter/material.dart';

import 'app_color.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30
        ),
        color: Color(0xffC91C22),
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ));
}
