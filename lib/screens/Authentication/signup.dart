import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'welcome.dart';
import 'auth_home.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.black,
                  )),
            ),
            backgroundColor: Color(0xffffffff),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Center(
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 60),
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff190933),
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
                                  color: Colors.pink,
                                  fontSize: 36,
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
                              child: TextFormField(
                                style: TextStyle(color: Colors.white70),
                                controller: userIdController,
                                decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsetsDirectional.only(start: 25.0),
                                  fillColor: Colors.lightBlueAccent,
                                  focusColor: Colors.lightBlueAccent,
                                  hintText: 'Enter email...',
                                  hintStyle: TextStyle(color: Colors.blueGrey),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white)
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 0,
                            ),
                            Divider(
                              color: Colors.white30,
                              thickness: 2,
                              indent: 25,
                              endIndent: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 85, 0),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsetsDirectional.only(start: 25.0),
                                    fillColor: Colors.lightBlueAccent,
                                    focusColor: Colors.lightBlueAccent,
                                    hintText: 'Enter a password',
                                    hintStyle: TextStyle(color: Colors.blueGrey),
                                    labelText: 'Create Password',
                                    labelStyle: TextStyle(color: Colors.white)
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Divider(
                              color: Colors.white30,
                              thickness: 2,
                              indent: 25,
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
                        ),),
                  ),
                ),
              ],
            )));
  }
}
