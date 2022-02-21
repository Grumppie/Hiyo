import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  final date, amount, category;

  Expense({this.date, this.amount, this.category});

  List<Widget> categoryIcon = [
    Icon(
        Icons.fastfood_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.airplanemode_active,
      color: Colors.white,
    ),
    Icon(
      Icons.shopping_cart,
      color: Colors.white,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (category=="food")?Color(0xffFF0000):Color(0xff6D9DC5),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
        
        width: double.infinity,
        height: 50.0,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (category=="food")?categoryIcon[0]:((category=="travel")?categoryIcon[1]:categoryIcon[3]),
            Text(
              date,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              amount,
              style: TextStyle(color: Colors.white),
            ),

          ],
        ));
  }
}
