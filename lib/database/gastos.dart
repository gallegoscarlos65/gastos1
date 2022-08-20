import 'package:flutter/widgets.dart';

import '../config.dart';

class Gastos with ChangeNotifier {
  String? concepto;
  double? cantidad;
  DateTime? fecha;
  Gastos({this.concepto, this.cantidad, this.fecha});
  void agregarCompra() {
    notifyListeners();
  }

  void remove(int indice) {
    losgastos.removeAt(indice);
    notifyListeners();
  }

  void update(int indice, double cantidad ,String concepto) {
    losgastos[indice].concepto = concepto;
    notifyListeners();
  }
}
