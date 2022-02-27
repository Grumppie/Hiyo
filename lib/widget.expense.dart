import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  final date, amount, category, title, subtitle;

  Expense({this.date, this.amount, this.category, this.title, this.subtitle});

  Map categoryIcons = {
    "food": Icon(
      Icons.fastfood_rounded,
      color: Colors.white,
    ),
    "travel": Icon(
      Icons.airplanemode_active,
      color: Colors.white,
    ),
    "shopping": Icon(
      Icons.shopping_cart,
      color: Colors.white,
    )
  };

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0,
        child: ListTile(
          title: Text(
            "${date}",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "${amount}",
            style: TextStyle(color: Colors.white),
          ),
          leading: categoryIcons[category],
          trailing: Text(
            "${amount}",
            style: TextStyle(color: Colors.white),
          ),
          selectedTileColor: Color(0xff190933),
          selected: true,

        ));
  }
}
