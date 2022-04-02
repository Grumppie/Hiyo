import 'package:flutter/cupertino.dart';
import 'package:hiyo/widget.expense.dart';

class ExpenseList extends ChangeNotifier {
  List<Expense> _ExpenseList = [];

  addExpense() {
    Expense expense = Expense(
      date: _ExpenseList.length,
      amount: _ExpenseList.length,
      category: "food",
      title: "food",
      subtitle: _ExpenseList.length,
    );
    _ExpenseList.add(expense);

    notifyListeners();
  }
}
