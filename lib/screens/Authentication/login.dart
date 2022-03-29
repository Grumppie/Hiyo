import 'package:flutter/material.dart';

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xffffffff),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Center(
                      child: Text(
                        "Welcome back !",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff1d2473),
                    ),
                    height: 300, //350
                    width: 250, //250
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
                          child: Text(
                            'Name:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 36,
                          endIndent: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 85, 0),
                          child: Text(
                            'Password:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 2,
                          indent: 36,
                          endIndent: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 58, 0),
                          child: Text(
                            'forgot password?',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ))
              ],
            )));
  }
}