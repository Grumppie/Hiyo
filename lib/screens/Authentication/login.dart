import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiyo/Providers/expense_provider.dart';
import 'package:hiyo/models/user.dart';
import 'package:hiyo/services/auth.dart';
import 'package:hiyo/utils/user_simple_preferences.dart';
import 'package:provider/provider.dart';
import 'auth_home.dart';

class WelcomeBack extends StatelessWidget {
  WelcomeBack({Key? key}) : super(key: key);

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.black,
              )),
        ),
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
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
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff1d2473),
                    ),
                    height: 350, //350
                    width: 250, //250
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.pinkAccent,
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
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 15),
                                controller: userIdController,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.cyan),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.cyan),
                                    ),
                                    // contentPadding: EdgeInsetsDirectional.only(start: 25.0),
                                    fillColor: Colors.lightBlueAccent,
                                    focusColor: Colors.lightBlueAccent,
                                    hintText: 'Enter email...',
                                    hintStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.white)),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter email.';
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          // Divider(
                          //   color: Colors.black,
                          //   thickness: 2,
                          //   indent: 25,
                          //   endIndent: 25,
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.cyan),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.cyan),
                                    ),
                                    // contentPadding: EdgeInsetsDirectional.only(start: 25.0),
                                    fillColor: Colors.lightBlueAccent,
                                    focusColor: Colors.lightBlueAccent,
                                    hintText: 'Enter password',
                                    hintStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.white)),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter password.';
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          // Divider(
                          //   color: Colors.black,
                          //   thickness: 2,
                          //   indent: 25,
                          //   endIndent: 25,
                          // ),
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
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: TextButton(
                      child: Text("Sign In", style: TextStyle(fontSize: 15)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          if (userIdController.text ==
                                  UserSimplePreferences.getUser().toString() &&
                              passwordController.text ==
                                  UserSimplePreferences.getPass().toString()) {
                            Provider.of<MainExpenseList>(context, listen: false)
                                .toggleLogged(true);
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          }
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
