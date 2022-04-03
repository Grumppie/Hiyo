import 'package:flutter/material.dart';
import 'package:hiyo/widget.expense.dart';

class MainExpenseList with ChangeNotifier{
  List <Widget>_expense = [
  ];

  int currentPageIndex = 0;

  List <Widget>getList(){
    return _expense;
  }

  int getPageIndex(){
    return currentPageIndex;
  }

  void changePageIndex(int newIndex){
    currentPageIndex = newIndex;
    notifyListeners();
  }

  void addExpenses({date,amount,category}){
    _expense.add(
      Expense(date: date,amount: amount,category: category,title: date,subtitle: amount,)
    );
    notifyListeners();
  }
}