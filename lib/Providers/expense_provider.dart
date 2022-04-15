import 'package:flutter/material.dart';
import 'package:hiyo/widget.expense.dart';

class MainExpenseList with ChangeNotifier {
  List <Widget>_expense = [
  ];
  num ?limit;
  num expenses = 0;
  int currentPageIndex = 0;

  List <Widget> getList() {
    return _expense;
  }

  int getPageIndex() {
    return currentPageIndex;
  }

  num ?getLimit(){
    return limit;
  }

  num getRemaining(){
    return expenses;
  }

  void changePageIndex(int newIndex) {
    currentPageIndex = newIndex;
    notifyListeners();
  }

  void addExpenses({date, amount, category}) {
    _expense.add(
        Expense(date: date,
          amount: amount,
          category: category,
          title: date,
          subtitle: amount,)
    );
    expenses += int.parse(amount);
    notifyListeners();
  }

  void setLimit(newLimit){
    limit = newLimit;
  }

}