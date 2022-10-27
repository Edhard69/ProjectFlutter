import 'package:flutter/material.dart';
import 'package:project1/screens/home_screen.dart';
import 'package:project1/screens/patrocinadors_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplicació',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
         '/':(context)=>PaginaPpal(),
         '/paginaPatrocinadors':(context)=>PaginaPatrocinadors(),
          //more routes
        }
    );
  }

}