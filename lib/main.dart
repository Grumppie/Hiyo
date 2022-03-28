import 'package:flutter/material.dart';
import 'package:hiyo/screens/home_page.dart';
import 'package:hiyo/screens/sign_in_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hiyo/screens/create_page.dart';
import 'package:hiyo/screens/statistics/create_page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final items = [
    Icon(
      Icons.home,
      size: 35,
      color: Colors.white,
    ),
    Icon(
      Icons.person,
      size: 35,
      color: Colors.white,
    ),
    Icon(
      Icons.add,
      size: 35,
      color: Colors.white,
    ),
    Icon(
      Icons.account_balance_wallet_outlined,
      size: 35,
      color: Colors.white,
    ),
  ];

  int currentIndex = 0;

  buttonColor(index) {
    return Color(0xffFF007F);
  }

  final Screens = [
    Home(),
    SignIn(),
    CreatePage(),
    StatsPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d2473),
        body: Screens[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.white)
          ),
          child: CurvedNavigationBar(
            color: Color(0xff190933),
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: buttonColor(currentIndex),
            height: 70,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),

            index: currentIndex,
            items: items,
            onTap: (index) => setState(() => {
              currentIndex = index,
              // print(index)
            }),
          ),
        ),
    );
  }
}
