import 'package:flutter/material.dart';
import 'package:gastos/config.dart';

import '../database/gastos.dart';

class widget_mediaquery extends StatefulWidget {
  widget_mediaquery({Key? key}) : super(key: key);

  @override
  State<widget_mediaquery> createState() => _widget_mediaqueryState();
}

final TextEditingController conceptControl = TextEditingController();
final TextEditingController cantidadControl2 = TextEditingController();

class _widget_mediaqueryState extends State<widget_mediaquery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 20 +
              MediaQuery.of(context)
                  .viewInsets
                  .bottom), //MediaQuery sirve para calcular el tamaño de la pantalla automaticamnete
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: conceptControl,
            decoration: const InputDecoration(hintText: "Concepto"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              controller: cantidadControl2,
              decoration: const InputDecoration(hintText: "Cantidad")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: _agregarGasto, child: const Text("Guardar"))
        ],
      ),
    );
  }

  void _agregarGasto() {
    Gastos gasto = Gastos(
        cantidad: double.parse(cantidadControl2.text),
        concepto: conceptControl.text,
        fecha: DateTime.now());

    setState(() {
      losgastos.add(gasto);
    });
    debugPrint(losgastos.toString());
    Navigator.pop(context);
  }
}
