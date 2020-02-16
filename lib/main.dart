import 'package:bestbank/application/config/di.dart';
import 'package:bestbank/application/mobile/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
   runApp(BestbankApp());
}

class BestbankApp extends StatelessWidget {
  static final injector = DependencyInjection().initialise(Injector.getInjector());
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.grey[700],
          accentColor: Colors.yellowAccent[400],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.yellowAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Home());
  }
}