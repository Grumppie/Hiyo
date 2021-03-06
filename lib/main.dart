import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiyo/Providers/expense_provider.dart';
import 'package:hiyo/screens/Authentication/auth_home.dart';
import 'package:hiyo/screens/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hiyo/screens/create_page.dart';
import 'package:hiyo/screens/statistics/create_page.dart';
import 'package:hiyo/services/auth.dart';
import 'package:hiyo/utils/user_simple_preferences.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyAPCbEzN9eC4wkwpvSBzZqDKtICDh2a1UA",
  //     appId: "1:75993715992:android:9fa332e04995620b243a6d",
  //     messagingSenderId: "XXX",
  //     projectId: "hiyo-49d6d",
  //   ),
  // );

  await UserSimplePreferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainExpenseList()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
    // Icon(
    //   Icons.person,
    //   size: 35,
    //   color: Colors.white,
    // ),
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
    // SignIn(),
    CreatePage(),
    StatsPage(),
  ];

  PageTitle(index) {
    switch (index) {
      case 0:
        {
          return Center(child: Text("Hiyo"));
        }
      // case 1:
      //   {
      //     return Center(child: Text("Authentication"));
      //   }
      case 1:
        {
          return Center(child: Text("Add Transactions"));
        }
      case 2:
        {
          return Center(child: Text("Statistics"));
        }
    }
  }

  late bool logged;

  @override
  void initState() {
    super.initState();
    logged = (UserSimplePreferences.getLogged() == "true") ? true : false;
    WidgetsBinding.instance!.addPostFrameCallback((_) => updateState());
  }

  void updateState() {
    if (logged) {
      Provider.of<MainExpenseList>(context, listen: false).toggleLogged(true);
    } else {
      Provider.of<MainExpenseList>(context, listen: false).toggleLogged(false);
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
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: (Provider.of<MainExpenseList>(context, listen: true)
                          .getLogged() ==
                      true)
                  ? (PageTitle(
                      Provider.of<MainExpenseList>(context, listen: true)
                          .getPageIndex()))
                  : Center(child: Text("Authentication")),
              backgroundColor: Color(0xff190947), //0xff190933
            ),
            extendBody: true,
            backgroundColor: Color(0xff1d2473),
            body: (Provider.of<MainExpenseList>(context, listen: true)
                        .getLogged() ==
                    true)
                ? Screens[Provider.of<MainExpenseList>(context, listen: true)
                    .getPageIndex()]
                : SignIn(),
            bottomNavigationBar: (Provider.of<MainExpenseList>(context,
                            listen: true)
                        .getLogged() ==
                    true)
                ? Theme(
                    data: Theme.of(context).copyWith(
                        iconTheme: IconThemeData(color: Colors.white)),
                    child: CurvedNavigationBar(
                      color: Color(0xff190933),
                      backgroundColor: Colors.transparent,
                      buttonBackgroundColor: buttonColor(
                          Provider.of<MainExpenseList>(context, listen: true)
                              .getPageIndex()),
                      height: 70,
                      animationCurve: Curves.easeInOut,
                      animationDuration: Duration(milliseconds: 300),
                      index: Provider.of<MainExpenseList>(context, listen: true)
                          .getPageIndex(),
                      items: items,
                      onTap: (index) => setState(() => {
                            Provider.of<MainExpenseList>(context, listen: false)
                                .changePageIndex(index),
                            // print(index)
                          }),
                    ),
                  )
                : Container(height: 0),
          ),
        ),
      ),
    );
  }
}
