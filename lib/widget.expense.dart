import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  final date, amount, category,title,subtitle;

  Expense({this.date, this.amount, this.category,this.title,this.subtitle});

  Map categoryIcons = {
    "food": Icon(
        Icons.fastfood_rounded,
      color: Colors.white,
    ),
    "travel": Icon(
      Icons.airplanemode_active,
      color: Colors.white,
    ),
    "shopping":Icon(
      Icons.shopping_cart,
      color: Colors.white,
    )
  };

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
    return Card(
      child:ListTile(title: Text("${title}"),subtitle: Text("${subtitle}"),
      leading: categoryIcons[category],trailing:Text("${title}"),
      selectedTileColor:Colors.cyan,selected:true,
    ));
  }
}
