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

  late Map<String, double> dataMap;

  @override
  void initState() {
    if (expenseList != null) {
      dataMap = {
        "Food & Drinks": expenseList
            ?.where((e) => e.category == "Food & Drinks")
            .toList()
            .length as double,
        "Travel": expenseList
            ?.where((e) => e.category == "Travel")
            .toList()
            .length as double,
        "Shopping": expenseList
            ?.where((e) => e.category == "Shopping")
            .toList()
            .length as double,
        "Gifts": expenseList
            ?.where((e) => e.category == "Gifts")
            .toList()
            .length as double,
        "Others": expenseList
            ?.where((e) => e.category == "Others")
            .toList()
            .length as double,
      };
    } else {
      dataMap = {
        "Food & Drinks": 1,
        "Travel": 1,
        "Shopping": 1,
        "Gifts": 1,
        "Others": 1,
      };
    }
  }

  get floatingActionButton => null;

  get floatingActionButtonLocation => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d2473),
      body: Column(
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
                dataMap: dataMap,
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
                      color: Colors.black,
                    )),
              ),
            ),
            Container(
              child: Table(
                  border: TableBorder
                      .all(), // Allows to add a border decoration around your table
                  children: [
                    TableRow(children: [
                      Text('Year'),
                      Text('Lang'),
                      Text('Author'),
                    ]),
                    TableRow(children: [
                      Text(
                        '2011',
                      ),
                      Text('Dart'),
                      Text('Lars Bak'),
                    ]),
                    TableRow(children: [
                      Text('1996'),
                      Text('Java'),
                      Text('James Gosling'),
                    ]),
                  ]),
            )
          ]),
    );
  }
}
