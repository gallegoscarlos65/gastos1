//WIDGET INDEPENDIENTE DE FORMADATOS
// ignore_for_file: list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:gastos/widgets/bitacora.dart';
import 'package:intl/intl.dart';
import '../config.dart';
import '../database/gastos.dart';
import '../database/semana.dart';
import '../run.dart';

// ignore: camel_case_types
DateTime hoy = DateTime.now();
final TextEditingController cantidadController = TextEditingController(); //CANTIDAD
final TextEditingController concepController = TextEditingController();

class formaWidget extends StatefulWidget {
  const formaWidget({Key? key}) : super(key: key);

  @override
  State<formaWidget> createState() => formaWidgetState();
}

class formaWidgetState extends State<formaWidget> {

  Bitacora bitacorita = new Bitacora();

  //CONTROLADORES DE TEXTO
  //CONCEPTO
//MÉTOOD DE AGREGAR UN GASTO

  void _agregarGasto() {
    //double cantidadCompra = double.parse(cantidadController.text);
    Gastos gasto = Gastos(

        // TODO Se hace una verificacion de que los controladores no esten vacios

        concepto: concepController.text.isEmpty ? "gasto" : concepController.text,
        cantidad: cantidadController.text.isEmpty ? 0.0 : double.parse(cantidadController.text),
        fecha: currentDate == null ? DateTime.now() : currentDate!);
    
    // TODO Se actualizan los campos a traves del setState
    setState(() {
      // TODO Se añade el gasto creado al arreglo de gastos
      losgastos.add(gasto);
      _rellenar();
      // TODO Metodo para sumar los gastos para posteriormente rellenar las graficas
      semana = sumaGastosSemana();
      
    });
    debugPrint(cantidadController.text);

    Navigator.pop(context);
    cantidadController.clear();
    concepController.clear();
    
  }

//MÉTODO DE RELLENAR
  void _rellenar() {
    losgastos = gastosSemana;
  }

  List<Gastos> get gastosSemana {
    return losgastos
        .where((gasto) => gasto.fecha!.isAfter(currentDate == null
            ? DateTime.now()
            : currentDate!.subtract(const Duration(days: 5))))
        .toList();
  }

  List<Semana> sumaGastosSemana() {
    return List.generate(5, (index) {
      currentDate == null
          ? hoy = DateTime.now().subtract(Duration(days: index))
          : hoy = currentDate!.subtract(Duration(days: index));
      double suma = 0;
      List<Gastos> gasto = gastosSemana;
      //debugPrint(DateTime.now().subtract(Duration(days: index)).toString());
      for (int i = 0; i < gasto.length; i++) {
        if (gasto[i].fecha!.day == hoy.day) {
          suma += gasto[i].cantidad!;
        }
      }
      // TODO Ayuda a devolver las graficas
      return Semana(
          dia: DateFormat('EEE').format(hoy).substring(0, 2), monto: suma);
    });
  }




  // TODO Fomrulario de la parte de abajo del floating action button
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: concepController,
            decoration: const InputDecoration(hintText: "Concepto:"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: cantidadController,
            decoration: const InputDecoration(hintText: "Cantidad"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                currentDate == null ||
                        concepController.text.isEmpty ||
                        cantidadController.text.isEmpty
                    ? showDialog(
                        barrierColor: Colors.blue[100],
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => AlertDialog(
                              backgroundColor: Colors.amber,
                              title: const Text("Alerta",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 25)),
                              content: const Text(
                                "Seleccione una fecha correcta que este dentro de los ultimos 7 días",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(fontSize: 20),
                                    ))
                              ],
                            ))
                    : _agregarGasto();
                enviarGasto.agregarCompra();
              },
              child: const Text("Guardar"))
        ],
      ),
    );
  }
}




class FormaW2 extends StatefulWidget {
  FormaW2({Key? key, required int? indice}) : super(key: key);

  @override
  State<FormaW2> createState() => _FormaW2State();
}


// TODO Este es el formulario de edicion
class _FormaW2State extends State<FormaW2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: concepController,
            decoration: InputDecoration(hintText: "Concepto"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: cantidadController,
            decoration: const InputDecoration(hintText: "Cantidad"),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(onPressed: (){

                                                    // losgastos[indice]
                                                    //     .remove(indice);
                                                    // eliminarGasto
                                                    //     .agregarCompra();
                                                    // //debugPrint(gastosSemana.toString());
                                                    // Navigator.pop(context);


          }, 
          child: Text("Actualizar"))
          
        ],
      ),
    );
  }
}
