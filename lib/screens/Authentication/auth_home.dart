import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

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
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Center(
                  child: Text(
                    "Hello!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: (MediaQuery.of(context).size.height / 2) - 350),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        // margin: EdgeInsets.fromLTRB(0, 110, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Color(0xff190933),
                        ),
                        height: 350,
                        width: 180,
                        child: Stack(
                          children: [
                            // SizedBox(
                            //   height: 130,
                            // ),
                            // //text: new here?
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 130, 0, 0),
                              child: Text(
                                'New here ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                              child: new TextButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size.fromHeight(
                                      350), // fromHeight use double.infinity as width and 40 is the height
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Welcome()));
                                },
                                child: new Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // Text(
                            //   "Sign Up!",
                            //   style: TextStyle(
                            //     fontSize: 36,
                            //     color: Colors.pink,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 25,
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(9.0),
                            //   child: Text(
                            //     "C'mon lets manage your expense",
                            //     style: TextStyle(
                            //       fontSize: 22,
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
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
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
                            child: Text(
                              'Returning ?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                            child: TextButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(
                                    300), // fromHeight use double.infinity as width and 40 is the height
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomeBack()));
                              },
                              child: new Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.pinkAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
