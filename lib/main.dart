import 'package:flutter/material.dart';
import 'package:food_ordering_app/pages/login.dart';
import 'package:food_ordering_app/pages/month_list.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => MOnthLIst(),
      }));
}
