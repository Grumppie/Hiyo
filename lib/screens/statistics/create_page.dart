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
        "Food & Drinks": 0,
        "Travel": 0,
        "Shopping": 0,
        "Gifts": 0,
        "Others": 0,
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
            height: 150,
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
          SizedBox(
            height: 50,
          ),
          /*Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              
              Container(
                width: 110.0,
                height: 130.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: const Color(0xff87ceeb),
                ),
                child: Center(
                  child: Text(
                    'your most \n\ spent was \n\on movies',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      color: Colors.black,
                      //height: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),'*/
        ],
      ),
    );
  }
}
