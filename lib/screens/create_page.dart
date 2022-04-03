import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Providers/expense_provider.dart';

class CreatePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {

  @override
  // 123504
  // 192.168.25.1:8090/httpclient.html
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final items = ['Food & Drinks', 'Travel', 'Shopping', 'Gifts'];
  String? value;

  TextEditingController amountController = TextEditingController(); //add class and object to store this variables
  TextEditingController dateController = TextEditingController(); //store the terminal info in object

  @override
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.white),
          //color:Colors.white,
        ),
      );

  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff1d2473),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Date
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Text('Add Expense',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff190933),
                    borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 30, 50, 0),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: dateController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3),
                            ),
                            // border: const OutlineInputBorder(),
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(5.0),
                            //     borderSide: BorderSide(
                            //       color: Color(0xff7b6f6f),
                            //     )),
                            icon: const Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.white,
                            ),
                            hintText: 'Enter Date',
                            hintStyle: TextStyle(color: Color(0xff7b6f6f)),
                            labelText: 'Date',
                            labelStyle: TextStyle(color: Color(0xff7b6f6f)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            //   borderSide: BorderSide(
                            //     color: Color(0xff7b6f6f),
                            //   ),
                            // ),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please select date.';
                            }
                            return null;
                          },
                        ),
                      ),

                      //Kharcha
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 50, 0),
                        child: TextFormField(
                          controller: amountController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3),
                            ),
                            // enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(5.0),
                            //     borderSide: BorderSide(
                            //       color: Color(0xff7b6f6f),
                            //     ),
                            // ),
                            icon: const Icon(
                              Icons.account_balance_wallet_outlined,
                              color: Colors.white,
                            ),
                            hintText: 'Enter amount',
                            hintStyle: TextStyle(color: Color(0xff7b6f6f)),
                            labelText: 'Amount',
                            labelStyle: TextStyle(color: Color(0xff7b6f6f)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(5.0),
                            //   borderSide: BorderSide(
                            //     color: Color(0xff7b6f6f),
                            //   ),
                            // ),
                          ),

                          // next 3 lines of code are to open numerical keyboard, and not character keyboard
                          // so that parsing amount input(text) into num wont throw exception
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter amount.';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 30.0,
              ),
              //category
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                padding: EdgeInsets.fromLTRB(12, 5, 20, 5),
                height: 72,
                decoration: BoxDecoration(
                  color: Color(0xff190933),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(
                        "Select Category",
                        style: TextStyle(color: Color(0xff7b6f6f)),
                      ),
                      focusColor: Color(0xff000000),
                      dropdownColor: Color(0xff00a7e1),
                      borderRadius: BorderRadius.circular(30),
                      isExpanded: true,
                      value: value,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(
                        () => this.value = value,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              //Save
              Container(
                child: Center(
                  child: TextButton(
                    child: Text("Save", style: TextStyle(fontSize: 15)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      // margin: EdgeInsets.all(100),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        //side: BorderSide(color: Colors.red)
                      )),
                    ),
                    onPressed: () {
                      // print(dateController.text);
                      // print(amountController.text);

                      // It returns true if the form is valid, otherwise returns false
                      if (_formKey.currentState!.validate()) {
                        context.read<MainExpenseList>().addExpenses(date: dateController,amount: amountController,category: value);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
