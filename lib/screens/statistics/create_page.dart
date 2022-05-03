import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatsPage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);
  Map<String, double> dataMap = {
    "Food & Drinks": 4,
    "Travel": 3,
    "Shopping": 2,
    "Gifts": 3,
    "Others": 2,
  };

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
