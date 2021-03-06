import 'package:flutter/material.dart';
import 'package:hiyo/Providers/expense_provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../../utils/user_simple_preferences.dart';
import '../../widget.expense.dart';

class StatsPage extends StatefulWidget {
  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  //const HomePage({ Key? key }) : super(key: key);

  List<Expense>? expenseList = UserSimplePreferences.getExpenses();

  double findLength(List list) {
    double length = 0;
    length += list.length;
    return length;
  }

  late Map<String, double> dataMap = (expenseList != null)
      ? {
          "Food & Drinks": findTotal(expenseList
                  ?.where((e) => e.category == "Food & Drinks")
                  .toList()) /
              findTotal(expenseList) *
              100,
          "Travel": findTotal(
                  expenseList?.where((e) => e.category == "Travel").toList()) /
              findTotal(expenseList) *
              100,
          "Shopping": findTotal(expenseList
                  ?.where((e) => e.category == "Shopping")
                  .toList()) /
              findTotal(expenseList) *
              100,
          "Gifts": findTotal(
                  expenseList?.where((e) => e.category == "Gifts").toList()) /
              findTotal(expenseList) *
              100,
          "Others": findTotal(
                  expenseList?.where((e) => e.category == "Others").toList()) /
              findTotal(expenseList) *
              100,
        }
      : {
          "Food & Drinks": 0.0,
          "Travel": 0.0,
          "Shopping": 0.0,
          "Gifts": 0.0,
          "Others": 0.0,
        };

  dynamic findTotal(List<Expense>? list) {
    double sum = 0;
    for (int i = 0; i < list!.length; i++) {
      sum += double.parse(list[i].amount);
    }
    return sum;
  }

  late Map<String, double> spentMap = (expenseList != null)
      ? {
          "Food & Drinks": findTotal(expenseList
              ?.where((e) => e.category == "Food & Drinks")
              .toList()) as double,
          "Travel": findTotal(
                  expenseList?.where((e) => e.category == "Travel").toList())
              as double,
          "Shopping": findTotal(
                  expenseList?.where((e) => e.category == "Shopping").toList())
              as double,
          "Gifts": findTotal(
                  expenseList?.where((e) => e.category == "Gifts").toList())
              as double,
          "Others": findTotal(
                  expenseList?.where((e) => e.category == "Others").toList())
              as double,
        }
      : {
          "Food & Drinks": 0,
          "Travel": 0,
          "Shopping": 0,
          "Gifts": 0,
          "Others": 0,
        };

  get floatingActionButton => null;

  get floatingActionButtonLocation => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d2473),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: //we rae saying htere are widgets inside this row
                <Widget>[
              Text(
                'Track Daily Expenses',
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                //child:
                child: PieChart(
                  dataMap: dataMap as Map<String, double>,
                  chartRadius: MediaQuery.of(context).size.width / 3,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32,
                  centerText: "spending",
                  legendOptions: const LegendOptions(
                    legendShape: BoxShape.circle,
                    legendPosition: LegendPosition.bottom,
                    showLegends: true,
                    showLegendsInRow: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      showChartValueBackground: true,
                      showChartValuesOutside: true,
                      showChartValues: true,
                      chartValueStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 23, 22, 22),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                padding: EdgeInsets.all(10.0),
                child: Table(
                    defaultColumnWidth: FixedColumnWidth(150.0),
                    border: TableBorder.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width:
                            1.5), // Allows to add a border decoration around your table
                    children: [
                      TableRow(children: [
                        Text(
                          'Category',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellowAccent),
                        ),
                        Text(
                          'spent',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellowAccent),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          'Food & Drinks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '${spentMap["Food & Drinks"]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          'Travel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '${spentMap["Travel"]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          'Shopping',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '${spentMap["Shopping"]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          'Gifts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '${spentMap["Gifts"]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          'Others',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '${spentMap["Others"]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          'total',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellowAccent),
                        ),
                        Text(
                          '${(spentMap["Others"]! + spentMap["Gifts"]! + spentMap["Shopping"]! + spentMap["Travel"]! + spentMap["Food & Drinks"]!) as double}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ]),
                    ]),
              )
            ]),
      ),
    );
  }
}
