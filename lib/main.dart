import 'package:calculadora_imc/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculadora de IMC",
      theme: new ThemeData(
        primaryColor: Color.fromARGB(255, 64,224,208),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}