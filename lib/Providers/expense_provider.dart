import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiyo/models/user.dart';
import 'package:hiyo/utils/user_simple_preferences.dart';
import 'package:hiyo/widget.expense.dart';

class MainExpenseList with ChangeNotifier {
  List<Expense>? _expense = [];
  num? limit;
  num expenses = 0;
  int currentPageIndex = 0;
  dynamic _Mylimit;
  bool New = true;

  String name = "", email = "", password = "";

  bool logged = false;

  bool getLogged() {
    return logged;
  }

  void toggleLogged(bool log) {
    logged = log;
    UserSimplePreferences.setLogged(logged);
    notifyListeners();
  }

  void setUserName(name) {
    this.name = name;
    notifyListeners();
  }

  void setUserEmail(email) {
    this.email = email;
    UserSimplePreferences.userEmail(email);
    notifyListeners();
  }

  void setUserPassword(password) {
    this.password = password;
    UserSimplePreferences.userPass(password);
    notifyListeners();
  }

  String getUserName() {
    return name;
  }

  String getUserEmail() {
    return email;
  }

  String getUserPassword() {
    return password;
  }

  void toggleNew() {
    New = !New;
  }

  bool getNew() {
    return New;
  }

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
    expenses = 0;
    for (int i = 0; i < _expense!.length; i++) {
      expenses += int.parse(_expense![i].amount);
    }
    notifyListeners();
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

  void emptyExpenseList() {
    _expense = [];
    UserSimplePreferences.clearData();
    setRemaining();
    notifyListeners();
  }
}
