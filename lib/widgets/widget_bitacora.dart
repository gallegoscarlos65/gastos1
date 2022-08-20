import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config.dart';

class widget_bitacora extends StatefulWidget {
  widget_bitacora({Key? key}) : super(key: key);

  @override
  State<widget_bitacora> createState() => _widget_bitacoraState();
}

class _widget_bitacoraState extends State<widget_bitacora> {
  @override
  Widget build(BuildContext context) {
    return losgastos.length == 0 ? cargarImagen() : ListView.builder(
        itemCount: losgastos.length,
        itemBuilder: (context,indice)=> Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(losgastos[indice].concepto!),
                subtitle: Text(DateFormat('dd-MM-yy').format(losgastos[indice].fecha!)),
                leading: Text("\$ ${losgastos[indice].cantidad.toString()}"),
                    tileColor: Colors.orange,
                    onLongPress: null,
                trailing: Wrap(
                  spacing: 10,
                  children: const [IconButton(onPressed: null, icon: Icon(Icons.delete)),
                             IconButton(onPressed: null, icon: Icon(Icons.edit))],
                ) 
)
            ],
          )));
  }//end build
  Widget cargarImagen()=>Card(elevation: 10,child:Image.asset("assets/images/anime-sleep.gif"));
}