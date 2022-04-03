import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  final date, amount, category, title, subtitle;

  Expense({this.date, this.amount, this.category, this.title, this.subtitle});

  Map categoryIcons = {
    "Food & Drinks": Icon(
      Icons.fastfood_rounded,
      color: Colors.white,
    ),
    "Travel": Icon(
      Icons.airplanemode_active,
      color: Colors.white,
    ),
    "Shopping": Icon(
      Icons.shopping_cart,
      color: Colors.white,
    ),
    "Gifts":Icon(
      Icons.card_giftcard_outlined,
      color: Colors.white,
    )
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: 200,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Center(child: categoryIcons[category]),
          Text("$date"),
          SizedBox(width: 5,),
          Text("$amount"),
        ],
      ),
    );
  }
}

// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15.0),
// ),
// elevation: 0,
// child: ListTile(
// title: Text(
// "${date}",
// style: TextStyle(color: Colors.white),
// ),
// subtitle: Text(
// "${amount}",
// style: TextStyle(color: Colors.white),
// ),
// leading: categoryIcons[category],
// trailing: Text(
// "${amount}",
// style: TextStyle(color: Colors.white),
// ),
// selectedTileColor: Color(0xff190933),
// selected: true,
//
// ));
