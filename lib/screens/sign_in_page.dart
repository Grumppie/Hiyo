import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 100),
              child: Center(
                child: Text(
                  "Hello!",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: [
                Align(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      color: Color(0xff190933),
                    ),
                    height: 350,
                    width: 180,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
                              child: Text(
                                "Sign Up!",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Align(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: Color(0xff1d2473),
                    ),
                    height: 280,
                    width: 180,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 86, 0, 0),
                              child: Text(
                                "Sign In!",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                      ],
                    ),

    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
