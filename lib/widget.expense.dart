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
    "Gifts": Icon(
      Icons.card_giftcard_outlined,
      color: Colors.white,
    ),
    "Others": Icon(
      Icons.accessibility,
      color: Colors.white,
    )
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff190933),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      height: 76,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: categoryIcons[category]),
          Text(
            "$date",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            "$amount",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
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
