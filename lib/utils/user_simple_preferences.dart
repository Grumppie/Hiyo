import 'dart:convert';

import 'package:hiyo/Providers/expense_provider.dart';
import 'package:hiyo/widget.expense.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preference;
  static const _Limit = 'MyLimit';

  static Future init() async =>
      _preference = await SharedPreferences.getInstance();

  static Future setLimit(String limit) async =>
      await _preference?.setString(_Limit, limit);

  static String? getLimit() => _preference?.getString(_Limit);

  static Future setExpenses(List<Expense>? expenseList) async {
    List<String>? storageList =
        expenseList?.map((e) => '${e.category}_${e.date}_${e.amount}').toList();
    storageList?.map((s) => print(s));
    await _preference?.setStringList('ExpenseList', storageList!);
  }

  static Future emptyExpenses() async {
    await _preference?.setStringList('ExpenseList', []);
  }

  static List<Expense>? getExpenses() {
    List<String>? storageList = _preference?.getStringList('ExpenseList');

    List<Expense>? expenseList = storageList
        ?.map((e) => Expense(
            category: e.split("_")[0],
            date: e.split("_")[1],
            amount: e.split("_")[2]))
        .toList();
    return expenseList;
  }

  static const _Email = "email", _Pass = "password";
  static Future userEmail(email) async {
    await _preference?.setString(_Email, email);
  }

  static String? getUser() => _preference?.getString(_Email);

  static Future userPass(pass) async {
    await _preference?.setString(_Pass, pass);
  }

  static String? getPass() => _preference?.getString(_Pass);

  static Future setLogged(bool log) async {
    await _preference?.setString("log", log.toString());
  }

  static String? getLogged() => _preference?.getString("log");
}
