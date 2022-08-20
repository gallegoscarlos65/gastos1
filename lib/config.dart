library config.globals;

import 'package:flutter/material.dart';
import 'package:gastos/database/gastos.dart';
import 'package:gastos/widgets/mitema.dart';

import 'database/semana.dart';

ThemeData temaPersonal = ThemeData(
  primarySwatch: Colors.purple,
  textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 11),
      bodyText1: TextStyle(fontStyle: FontStyle.italic)),
);
/*
List<Gastos> losgastos = [
  Gastos(concepto: "Papos kuchao", cantidad: 1000, fecha: DateTime.now()),
  Gastos(concepto: "Pañales 12 pz", cantidad: 65, fecha: DateTime.now()),
  Gastos(concepto: "Formula Nan", cantidad: 590, fecha: DateTime.now()),
];
*/
List<Gastos> losgastos = [];
//
List<Semana> semana = [
  Semana(dia: "L", monto: 20),
  Semana(dia: "M", monto: 70),
  Semana(dia: "Mi", monto: 120),
  Semana(dia: "J", monto: 200),
  Semana(dia: "V", monto: 50),
];

MiTema themach = MiTema();
Gastos enviarGasto = Gastos();
Gastos editarGasto = Gastos();
Gastos eliminarGasto = Gastos();

