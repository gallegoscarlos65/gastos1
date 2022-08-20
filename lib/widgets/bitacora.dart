import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:gastos/run.dart';
import 'package:gastos/widgets/forma.dart';
import 'package:gastos/widgets/widget_mediaquery.dart';
import 'package:intl/intl.dart';

int? indice;

class Bitacora extends StatefulWidget {
  Bitacora({Key? key}) : super(key: key);

  @override
  State<Bitacora> createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
  void actualizar() async {
    return await showModalBottomSheet(
        context: context,
        builder: (_) => FormaW2(
              indice: indice,
            ));
  }

  @override
  void initState() {
    super.initState();
    eliminarGasto.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return losgastos.isEmpty
        ? cargarImagen()
        : ListView.builder(
            itemCount: losgastos.length,
            itemBuilder: (context, indice) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            IconButton(
                                onPressed: actualizar,
                                icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,)
                                // onPressed: () {
                                //   losgastos[indice]
                                //       .remove(indice);
                                //   eliminarGasto
                                //       .agregarCompra();
                                //   //debugPrint(gastosSemana.toString());
                                //   //Navigator.pop(context);                                  

                                //         // setState(() {
                                //         //   _rellenar();
                                //         //   // TODO Metodo para sumar los gastos para posteriormente rellenar las graficas
                                //         //   semana = sumaGastosSemana();
                                //         // });


                                // },
                                // icon: const Icon(Icons.edit,
                                // color: Colors.blue,),


                                ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    barrierColor: Colors.blue[100],
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        backgroundColor: Colors.amber,
                                            title: const Text("Alerta",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 25)),
                                            content: Text(
                                              "¿Esta seguro de borrar el gasto '${losgastos[indice].concepto}'?",
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            actions: [
                                              TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all<
                                                              Color>(const Color
                                                                  .fromARGB(255,
                                                              11, 202, 2))),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Volver",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  )),
                                              TextButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all<
                                                              Color>(const Color
                                                                  .fromARGB(
                                                              255, 177, 9, 9))),
                                                  onPressed: () {


                                                  setState(() {
                                                    losgastos[indice]
                                                    .remove(indice);
                                                    eliminarGasto
                                                    .agregarCompra();
                                                    

                                                    //debugPrint(gastosSemana.toString());
                                                    Navigator.pop(context); 
                                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Run()),);
                                                   
                                                  });

                                                  

                                                  // formaWidget();

                                                  },
                                                  child: const Text(
                                                    "Eliminar",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ))
                                            ],
                                          ));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                        title: Text(losgastos[indice].concepto!),
                        subtitle: Text(DateFormat('dd-MM-yy')
                            .format(losgastos[indice].fecha!)),
                        leading:
                            Text("\$ ${losgastos[indice].cantidad.toString()}"))
                  ],
                )));
  } //end build

  Widget cargarImagen() => Card(
        elevation: 5,
        child: Image.asset("assets/images/waiting.png"),
      );
}
