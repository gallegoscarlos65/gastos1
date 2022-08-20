import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:gastos/config.dart';

import '../database/semana.dart';

class Barritas extends StatefulWidget {
  const Barritas({Key? key}) : super(key: key);

  @override
  State<Barritas> createState() => _BarritasState();
}

class _BarritasState extends State<Barritas> {
  ChartSeriesController? _chartSeriesController;
  /*List<Semana> _semana = [
    Semana(dia: "L", monto: 50),
    Semana(dia: "M", monto: 60),
    Semana(dia: "Mi", monto: 80),
    Semana(dia: "J", monto: 120),
    Semana(dia: "V", monto: 90)
  ];*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enviarGasto.addListener(() {
      setState(() {});
    });
    eliminarGasto.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(5),
        child: SfCartesianChart(
          isTransposed: true, //pone las barras en vertical
          primaryXAxis: CategoryAxis(),
          //titulo
          title: ChartTitle(text: "Presupuesto Semanal"),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(decimalPlaces: 2, enable: true),
          series: <ChartSeries<Semana, String>>[
            BarSeries<Semana, String>(
                name: "Gastos",
                dataLabelSettings: const DataLabelSettings(
                    color: Color.fromARGB(255, 39, 212, 243), isVisible: true),
                onRendererCreated: (controller) => _chartSeriesController,
                dataSource: semana,
                xValueMapper: (semana, _) => semana.dia,
                yValueMapper: (semana, _) => semana.monto),
          ],
        ));
  }
}
