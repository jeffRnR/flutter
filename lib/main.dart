import 'package:app1/pages/AddProductPage.dart';
import 'package:app1/pages/AdminPanelPage.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xE6FFE6)
      ),
      routes: {
        "/": (context) => AdminPanelPage(),
        "addProductPage": (context) => AddProductPage(),
      },
    );
  }
}