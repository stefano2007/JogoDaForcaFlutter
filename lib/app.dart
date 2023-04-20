import 'package:flutter/material.dart';
import 'controllers/AppController.dart';
import 'views/JogoForcaPage.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppPageState();
}

class _AppPageState extends State<App>{

  refresh() {
    setState(() {
      debugPrint('refresh App');
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: AppController.instance.isModoNoturno ? Brightness.dark : Brightness.light,
      ),
      home: JogoForcaPage(title: 'Jodo da Forca'),
    );
  }
}