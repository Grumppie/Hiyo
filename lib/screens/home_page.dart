import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyo/screens/create_page.dart';
import 'package:hiyo/widget.expense.dart';
import 'package:provider/provider.dart';
import '../Providers/expense_provider.dart';

class Home extends StatelessWidget {
  List <Widget>data = [
    Expense(date:"Work In Progress",amount: 404,category: "food",title: 404,subtitle: 100,),
  ];
  num goal = 5000;
  num remaining = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1d2473),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1315&q=80'),
                              radius: 30,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hey!",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                Text(
                                  "uknown user ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xff190933),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      constraints: BoxConstraints(
                        minWidth: 400,
                        maxWidth: 400,
                        minHeight: 180,
                      ),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "My Limit:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              )),
                          Text(
                            "$goal",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45.0,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Spent:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              )),
                          Text(
                            "$remaining",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45.0,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: data.map((e) => e).toList(),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

// FloatingActionButton(
// backgroundColor: Color(0xffff007f),
// onPressed: () async {
// final expanses = await Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => CreatePage(),
// ),
// );
// setState(() {
// data.add(Expense(date:expanses.date,amount:expanses.amount,category:expanses.category,title: "sheess",subtitle: "sheeeeesh",));
// remaining += int.parse(expanses.amount);
// });
// },
// child: Icon(Icons.add),
// ),
