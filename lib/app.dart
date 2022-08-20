import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:gastos/widgets/forma.dart';

import 'package:provider/provider.dart';

import 'database/gastos.dart';
import 'run.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    themach.addListener(() {
      setState(() {});
    });
    enviarGasto.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themach.actual(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Run(),
    );
  }
}
