import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiyo/models/user.dart';
import 'package:hiyo/widget.expense.dart';

class MainExpenseList with ChangeNotifier {
  List<Expense>? _expense = [];
  num? limit;
  num expenses = 0;
  int currentPageIndex = 0;
  dynamic _Mylimit;

  AppUser _UserFromFirebaseUser(User? user) {
    return AppUser(uid: user?.uid);
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // AppUser? user = AppUser(uid: "muup4VK3WRhb6qUbefjZcpukpwE3");

  // Stream<AppUser> get user {
  //   return _auth.authStateChanges().map(_UserFromFirebaseUser);
  // }

  List<Expense>? getList() {
    return _expense;
  }

  dynamic getMyLimit() {
    return _Mylimit;
  }

  void changeMyLimit(lim) {
    _Mylimit = lim;
  }

  // AppUser? getuser() {
  //   return user;
  // }

  // void setUser(uid) {
  //   user = uid;
  //   notifyListeners();
  // }

  // void setUsernull() {
  //   user = null;
  //   notifyListeners();
  // }

  int getPageIndex() {
    return currentPageIndex;
  }

  num? getLimit() {
    return limit;
  }

  num getRemaining() {
    return expenses;
  }

  void setRemaining() {
    for (int i = 0; i < _expense!.length; i++) {
      expenses += int.parse(_expense![i].amount);
    }
  }

  void changePageIndex(int newIndex) {
    currentPageIndex = newIndex;
    notifyListeners();
  }

  void addExpenses({date, amount, category}) {
    _expense?.add(Expense(
      date: date,
      amount: amount,
      category: category,
      title: date,
      subtitle: amount,
    ));
    notifyListeners();
  }

  void setLimit(newLimit) {
    limit = newLimit;
    notifyListeners();
  }

  void setExpenseList(List<Expense> expenseList) {
    _expense = expenseList;
    notifyListeners();
  }
}
