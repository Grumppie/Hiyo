import 'package:flutter/material.dart';
import 'package:hiyo/screens/Authentication/auth_home.dart';
import 'package:hiyo/screens/home_page.dart';
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
  List<Widget> data = [];

  buttonColor(index) {
    return Color(0xffFF007F);
  }

  final Screens = [
    Home(),
    SignIn(),
    CreatePage(data: []),
    StatsPage()
  ];

  PageTitle(index){
    switch(index){
      case 0:{
        return Center(child: Text("Hiyo"));
      }
      case 1:{
        return Center(child: Text("Authentication"));
      }
      case 2:{
        return Center(child: Text("Add Transactions"));
      }
      case 3:{
        return Center(child: Text("My Transactions"));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff190933),
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            appBar: AppBar(
              title: PageTitle(currentIndex),
              backgroundColor: Color(0xff190947),//0xff190933
            ),
            extendBody: true,
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
          ),
        ),
      ),
    );
  }
}
