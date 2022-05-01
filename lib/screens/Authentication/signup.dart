import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiyo/services/auth.dart';
//import 'welcome.dart';
import 'auth_home.dart';

class Welcome extends StatelessWidget {
  Welcome({Key? key}) : super(key: key);

  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();

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
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
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
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff190933),
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
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                child: TextFormField(
                                    // key: _formKey,
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
                                        fillColor: Colors.lightBlueAccent,
                                        focusColor: Colors.lightBlueAccent,
                                        hintText: 'Enter email...',
                                        hintStyle:
                                            TextStyle(color: Colors.blueGrey),
                                        labelText: 'Email',
                                        labelStyle:
                                            TextStyle(color: Colors.white)),
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
                              //   color: Colors.white30,
                              //   thickness: 2,
                              //   indent: 25,
                              //   endIndent: 25,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                                        fillColor: Colors.lightBlueAccent,
                                        focusColor: Colors.lightBlueAccent,
                                        hintText: 'Enter a password',
                                        hintStyle:
                                            TextStyle(color: Colors.blueGrey),
                                        labelText: 'Create Password',
                                        labelStyle:
                                            TextStyle(color: Colors.white)),
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
                              //   color: Colors.white30,
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
                          child:
                              Text("Sign Up", style: TextStyle(fontSize: 15)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.pink),
                            // margin: EdgeInsets.all(100),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              dynamic result = await _auth.signInAnon();
                              if (result == null) {
                                print("error");
                              } else {
                                print('signed in');
                                print(result);
                              }
                            }
                          }),
                    ),
                  ),
                ],
              ),
            )));
  }
}
