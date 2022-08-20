import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class widget_barras extends StatefulWidget {
  widget_barras({Key? key}) : super(key: key);

  @override
  State<widget_barras> createState() => _widget_barrasState();
}

class _widget_barrasState extends State<widget_barras> {
  @override
  Widget build(BuildContext context) {
    return tabless(context);
  }

  @override
  Widget tabless(BuildContext context) {
    return Container(
        child: Center(
            child: Container(
                child: SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
          // Initialize line series
          LineSeries<ChartData, String>(
              dataSource: [
                // Bind data source
                ChartData('Jan', 35),
                ChartData('Feb', 28),
                ChartData('Mar', 34),
                ChartData('Apr', 32),
                ChartData('May', 40)
              ],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
