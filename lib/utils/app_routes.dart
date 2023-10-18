import 'package:flutter/material.dart';
import 'package:student_info/screens/edit_screen.dart';
import 'package:student_info/screens/home_screen.dart';
import 'package:student_info/screens/splash_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => SplashScreen(),
  'home':(context) => HomeScreen(),
  'edit': (context) => EditScreen(),
};
