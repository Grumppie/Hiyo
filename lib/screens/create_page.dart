import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hiyo/screens/home_page.dart';
import 'package:hiyo/widget.expense.dart';
import 'package:flutter/services.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'My Transactions';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
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
    State<StatefulWidget> createState() => new MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final items = ['Food & Drinks', 'Travel', 'Shopping', 'Gifts'];
  String? value;
  TextEditingController amountController =
      TextEditingController(); //add class and object to store this variables
  TextEditingController dateController =
      TextEditingController(); //store the terminal info in object

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
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Date
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff0e4562),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              margin: EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 30, 50, 0),
                    child: TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )),
                        icon: const Icon(
                          Icons.calendar_view_day_rounded,
                          color: Colors.white,
                        ),
                        hintText: 'Enter Date',
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: 'Date',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid date';
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
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )),
                        icon: const Icon(
                          Icons.money,
                          color: Colors.white,
                        ),
                        hintText: 'Enter amount',
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: 'Amount',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // next 3 lines of code are to open numerical keyboard, and not character keyboard
                      // so that parsing amount input(text) into num wont throw exception
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter valid amount';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30.0,
            ),
            //category
            Container(
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
              padding: EdgeInsets.fromLTRB(12, 5, 20, 5),
              decoration: BoxDecoration(

                color: Colors.purple,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      "Select Category",
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.purple,
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
                        EdgeInsets.symmetric(horizontal: 30,vertical: 15)),
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
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Data is in processing.')));

                      Navigator.of(context, rootNavigator: true).pop(Expense(
                        date: dateController.text,
                        amount: amountController.text,
                        category: value,
                      ));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
