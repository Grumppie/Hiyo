import 'package:flutter/material.dart';
import 'package:hiyo/screens/statistics/create_page.dart';
import 'package:pie_chart/pie_chart.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatsPage(),
      //home:DemoApp(),
    );
  }
}
