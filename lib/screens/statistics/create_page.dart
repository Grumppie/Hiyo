import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class create_page extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);
  Map<String,double> dataMap={
    "Food":5,
    "Education":3,
    "Bills":2,
    "Others":2,
  };

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Pie Chart"),
        centerTitle: true,
        backgroundColor: Colors.green,
        brightness: Brightness.dark,
      ),

      

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: //we rae saying htere are widgets inside this row
              <Widget>[
                
            Text('Weekly',style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontSize: 20,
            ),),
            
            SizedBox(height: 50,),

            Container(
                child: Center(
            child: PieChart(dataMap: dataMap,chartRadius: MediaQuery.of(context).size.width / 3.6,
            chartType: ChartType.ring,
            
            ringStrokeWidth: 32,
            centerText: "spending",
            legendOptions: LegendOptions(legendShape: BoxShape.rectangle,legendPosition: LegendPosition.bottom,showLegends: true,
            legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
        ),),
            chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true,
            showChartValueBackground: true,
            showChartValuesOutside:true,
            showChartValues: true,
            chartValueStyle: TextStyle(  
            fontWeight: FontWeight.bold,
            color: Colors.black,
        )
            
            ),
          ),
        ),
              )
      /*body: Container(
      
        //child:Text('Weekly'),
        padding:EdgeInsets.all(20.0),
        child: Center(
            child: PieChart(dataMap: dataMap,chartRadius: MediaQuery.of(context).size.width / 3.6,
            chartType: ChartType.ring,
            
            ringStrokeWidth: 32,
            centerText: "spending",
            legendOptions: LegendOptions(legendShape: BoxShape.rectangle,legendPosition: LegendPosition.bottom,showLegends: true,
            legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
        ),),
            chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true,
            showChartValueBackground: true,
            showChartValuesOutside:true,
            showChartValues: true,
            chartValueStyle: TextStyle(  
            fontWeight: FontWeight.bold,
            color: Colors.black,
        )
            
            ),
          ),
        ),
      
    ),
    */
                ]  ),
    );
  }
}

