import 'package:farmer/ui/report/line_chart.dart';
import 'package:farmer/ui/report/price_points.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late List<RadishSalesData> _radishChartData;
  late List<CabbageSalesData> _cabbageChartData;
  late List<CarrotSalesData> _carrotChartData;
  late List<TomatoSalesData> _tomatoChartData;
  late String _selectedData;

  List<RadishSalesData> getRadishChartData() {
    final List<RadishSalesData> radishChartData = [
      RadishSalesData('Jan-Mar',25),
      RadishSalesData('Apr-Jun',12),
      RadishSalesData('Jul-Sep',18),
      RadishSalesData('Oct-Dec',30)
    ];
    return radishChartData;
}
  List<CabbageSalesData> getCabbageChartData() {
    final List<CabbageSalesData> cabbageChartData = [
      CabbageSalesData('Jan-Mar',35),
      CabbageSalesData('Apr-Jun',22),
      CabbageSalesData('Jul-Sep',28),
      CabbageSalesData('Oct-Dec',40)
    ];
    return cabbageChartData;
  }
  List<CarrotSalesData> getCarrotChartData() {
    final List<CarrotSalesData> carrotChartData = [
      CarrotSalesData('Jan-Mar',45),
      CarrotSalesData('Apr-Jun',32),
      CarrotSalesData('Jul-Sep',38),
      CarrotSalesData('Oct-Dec',50)
    ];
    return carrotChartData;
  }
  List<TomatoSalesData> getTomatoChartData() {
    final List<TomatoSalesData> tomatoChartData = [
      TomatoSalesData('Jan-Mar',55),
      TomatoSalesData('Apr-Jun',42),
      TomatoSalesData('Jul-Sep',48),
      TomatoSalesData('Oct-Dec',60)
    ];
    return tomatoChartData;
  }

  @override
  void initState() {
    _radishChartData = getRadishChartData();
    _cabbageChartData = getCabbageChartData();
    _carrotChartData = getCarrotChartData();
    _tomatoChartData = getTomatoChartData();
    _selectedData = 'All Sales Data'; // Set default selection
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedData,
            onChanged: (String? newValue) {
              setState(() {
                _selectedData = newValue ?? '';
              });
            },
            items: <String>['All Sales Data','Radish', 'Cabbage','Carrot', 'Tomato'].map<DropdownMenuItem<String>>(
                  (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          Expanded(
            child: SfCartesianChart(
              title: ChartTitle(text: 'All Sales Analysis'),
              legend: Legend(isVisible: true, position: LegendPosition.bottom),
              primaryXAxis: CategoryAxis(),
              series: _selectedData == 'All Sales Data'
                  ? <CartesianSeries>[
                LineSeries<RadishSalesData, String>(
                  dataSource: _radishChartData,
                  xValueMapper: (RadishSalesData sales, _) => sales.year,
                  yValueMapper: (RadishSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Radish',
                ),
                LineSeries<CabbageSalesData, String>(
                  dataSource: _cabbageChartData,
                  xValueMapper: (CabbageSalesData sales, _) => sales.year,
                  yValueMapper: (CabbageSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Cabbage',
                ),
                LineSeries<CarrotSalesData, String>(
                  dataSource: _carrotChartData,
                  xValueMapper: (CarrotSalesData sales, _) => sales.year,
                  yValueMapper: (CarrotSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Carrot',
                ),
                LineSeries<TomatoSalesData, String>(
                  dataSource: _tomatoChartData,
                  xValueMapper: (TomatoSalesData sales, _) => sales.year,
                  yValueMapper: (TomatoSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Tomato',
                ),
              ]
                  : _selectedData == 'Radish'
                  ? <CartesianSeries>[
                LineSeries<RadishSalesData, String>(
                  dataSource: _radishChartData,
                  xValueMapper: (RadishSalesData sales, _) => sales.year,
                  yValueMapper: (RadishSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Radish',
                ),
              ]
                  : _selectedData == 'Cabbage'
                  ? <CartesianSeries>[
                LineSeries<CabbageSalesData, String>(
                  dataSource: _cabbageChartData,
                  xValueMapper: (CabbageSalesData sales, _) => sales.year,
                  yValueMapper: (CabbageSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Cabbage',
                ),
              ]
                  : _selectedData == 'Carrot'
                  ? <CartesianSeries>[
                LineSeries<CarrotSalesData, String>(
                  dataSource: _carrotChartData,
                  xValueMapper: (CarrotSalesData sales, _) => sales.year,
                  yValueMapper: (CarrotSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Carrot',
                ),
              ]
                  : _selectedData == 'Tomato'
                  ? <CartesianSeries>[
                LineSeries<TomatoSalesData, String>(
                  dataSource: _tomatoChartData,
                  xValueMapper: (TomatoSalesData sales, _) => sales.year,
                  yValueMapper: (TomatoSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Tomato',
                ),
              ]
                  : <CartesianSeries>[
                LineSeries<CabbageSalesData, String>(
                  dataSource: _cabbageChartData,
                  xValueMapper: (CabbageSalesData sales, _) => sales.year,
                  yValueMapper: (CabbageSalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  legendItemText: 'Cabbage',
                ),
              ],
              // primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
            ),
          ),
        ],
      ),
    );
  }
}

class RadishSalesData {
  final String year;
  final double sales;
  RadishSalesData(this.year, this.sales);
}
class CabbageSalesData {
  final String year;
  final double sales;
  CabbageSalesData(this.year, this.sales);
}
class CarrotSalesData {
  final String year;
  final double sales;
  CarrotSalesData(this.year, this.sales);
}
class TomatoSalesData {
  final String year;
  final double sales;
  TomatoSalesData(this.year, this.sales);
}
