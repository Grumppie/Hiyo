import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiyo/screens/create_page.dart';
import 'package:hiyo/services/auth.dart';
import 'package:hiyo/utils/user_simple_preferences.dart';
import 'package:hiyo/widget.expense.dart';
import 'package:provider/provider.dart';
import '../Providers/expense_provider.dart';

import 'package:http/http.dart' as http;

// Future<Album> fetchAlbum() async {
//   final response =
//       await http.get(Uri.parse('http://localhost:4000/transactions'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final List<dynamic> data;

//   const Album({required this.data});

//   factory Album.fromJson(List<dynamic> json) {
//     return Album(data: json.toList());
//   }
// }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String limit = "";
  num remaining = 0;
  List<Expense>? expenseList;

  TextEditingController _limitController = TextEditingController();
  bool _isEnabled = false;

  // final AuthService _auth = AuthService();

  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
    // print(futureAlbum);
    limit = UserSimplePreferences.getLimit() ?? '';
    expenseList = UserSimplePreferences.getExpenses();
    // print(expenseList?[0].amount);
    WidgetsBinding.instance!.addPostFrameCallback((_) => updateState());
  }

  void updateState() {
    if (expenseList != null) {
      Provider.of<MainExpenseList>(context, listen: false)
          .setExpenseList(expenseList!);
      // for (int i = 0; i < expenseList.length; i++) {
      //   remaining += expenseList[i].amount as num;
      // }
      Provider.of<MainExpenseList>(context, listen: false).setRemaining();
    }
    Provider.of<MainExpenseList>(context, listen: false).changeMyLimit(limit);
  }

  bool New = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1d2473),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
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
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Text(
                              "unknown user ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        // RaisedButton(onPressed: () async {
                        //   await _auth.SignOut();
                        //   Provider.of<MainExpenseList>(context, listen: false)
                        //       .setUsernull();
                        // })
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
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  // constraints: BoxConstraints(
                  //   minWidth: 400,
                  //   maxWidth: 400,
                  //   minHeight: 180,
                  // ),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "My Limit:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Column(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Rs. ",
                              hintStyle: TextStyle(color: Colors.white12),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.cyan),
                              ),
                              fillColor: Colors.lightBlueAccent,
                              focusColor: Colors.lightBlueAccent,
                            ),
                            initialValue: limit,
                            // controller: Provider.of<MainExpenseList>(context,
                            //         listen: true)
                            //     .getMyLimit(),
                            onChanged: (limit) =>
                                setState(() => this.limit = limit),
                            enabled: _isEnabled,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.white,
                            onPressed: () {
                              setState(
                                () {
                                  _isEnabled = true;
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.save),
                            color: Colors.white,
                            onPressed: () async {
                              await UserSimplePreferences.setLimit(limit);

                              Provider.of<MainExpenseList>(context,
                                      listen: false)
                                  .changeMyLimit(limit);
                              setState(
                                () {
                                  _isEnabled = false;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Spent:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${Provider.of<MainExpenseList>(context, listen: true).getRemaining()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Remaining:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${int.parse(limit) - Provider.of<MainExpenseList>(context, listen: true).getRemaining()}",
                                style: TextStyle(
                                    color: (int.parse(limit) -
                                                Provider.of<MainExpenseList>(
                                                        context,
                                                        listen: true)
                                                    .getRemaining() >
                                            0)
                                        ? Colors.greenAccent
                                        : Colors.redAccent,
                                    fontSize: 25.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                      child: Text(
                        "My Transactions",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                          setState(
                            () {},
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                // IconButton(
                //   icon: Icon(Icons.delete),
                //   color: Colors.white,
                //   onPressed: () async {
                //     await UserSimplePreferences.emptyExpenses();
                //   },
                // ),
                SingleChildScrollView(
                  child: Column(
                    children:
                        Provider.of<MainExpenseList>(context, listen: true)
                            .getList()!
                            .map((e) => e)
                            .toList(),
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
