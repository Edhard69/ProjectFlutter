// @dart=2.9

import 'package:flutter/material.dart';
import 'package:project1/screens/home_screen.dart';
import 'package:project1/screens/patrocinadors_screen.dart';
import 'package:project1/screens/notificacions_screen.dart';
import 'package:project1/screens/ferte-soci_screen.dart';
import 'package:project1/screens/resultats_screen.dart';
import 'package:project1/screens/descomptes-i-serveis_screen.dart';
import 'package:project1/screens/noticies_screen.dart';
import 'package:project1/screens/login_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CB Balaguer',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        routes: {
          '/':(context)=>PaginaPpal(),
          '/paginaPatrocinadors':(context)=>PaginaPatrocinadors(),
          '/paginaNotificacions':(context)=>PaginaNotificacions(),
          '/paginaFerteSoci':(context)=>PaginaFerteSoci(),
          '/paginaResultats':(context)=>PaginaResultats(),
          '/paginaDescomptesIServeis':(context)=>PaginaDescomptesIServeis(),
          '/paginaNoticies':(context)=>PaginaNoticies(),
          '/paginaLogin':(context)=>PaginaLogin(),
        }
    );
  }
}