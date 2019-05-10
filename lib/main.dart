import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './home/home_screen.dart';
import 'constants.dart' show AppColors;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "微信",
        home: HomeScreen(),
        theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
          cardColor: Color(AppColors.AppBarColor)
        ));
  }
}
