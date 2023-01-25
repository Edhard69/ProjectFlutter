import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project1/screens/carnet-soci-screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaginaNotificacions extends StatefulWidget {
  @override
  _PaginaNotificacionsState createState() => _PaginaNotificacionsState();
}

class _PaginaNotificacionsState extends State<PaginaNotificacions> {

  static const colorPpal = Colors.red;
  late dynamic notificacionsRes = [];

  //init
  @override
  initState(){
    super.initState();
    notificacions().then((value) => setState(() {
      this.notificacionsRes = value;
      print(value);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificacions"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: new Icon(Icons.home),
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: PageView(
        //imprimir un lista con las notificaciones
        children: [
          ListView.builder(
            itemCount: notificacionsRes.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(notificacionsRes[index]['titol']),
                  subtitle: Text(notificacionsRes[index]['missatge']),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.notifications_on),
              iconColor: colorPpal,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: colorPpal, width: 1),
              ),
              title: const Text('Notificacions'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaNotificacions');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              iconColor: colorPpal,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: colorPpal, width: 1),
              ),
              title: const Text('Fer-te Soci'),
              onTap: () async {
                takeId().then(
                        (value) => {
                      if(value == null){
                        Navigator.pushNamed(context, '/paginaFerteSoci')
                      }else{
                        consulta(value).then(
                                (value2) => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CarnetSociScreen(
                                            value2["nom"],
                                            value2["cognom"],
                                            value2["correu"],
                                            value2["id"]
                                        )
                                ),
                              ),
                            }
                        ),
                      }
                    }

                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search),
              iconColor: colorPpal,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: colorPpal, width: 1),
              ),
              title: const Text('Resultats'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaResultats');
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              iconColor: colorPpal,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: colorPpal, width: 1),
              ),
              title: const Text('Patrocinadors'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaPatrocinadors');
              },
            ),
            ListTile(
              leading: const Icon(Icons.discount),
              iconColor: colorPpal,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: colorPpal, width: 1),
              ),
              title: const Text('Descomptes i Serveis'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaDescomptesIServeis');
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              iconColor: colorPpal,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: colorPpal, width: 1),
              ),
              title: const Text('Noticies'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaNoticies');
              },
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(
                  Icons.home,
                  size: 40.0,
                  color: colorPpal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<int?> takeId() async {
  final prefs = await SharedPreferences.getInstance();
  final int? idUser = prefs.getInt('idUser');
  return idUser;
}

Future<dynamic> consulta(int idUser) async {
  String username = 'app';
  String password = 'pdB9z)fD!KL&5Xzs*@AX3!rE';
  String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  var url ='http://cbbalaguer.cat/wp-json/wp/v2/users/$idUser';
  const JsonCodec json = JsonCodec();
  var body2;
  final response = await http.Client().get(Uri.parse(url),
      headers: {"Accept": "application/json", "authorization": basicAuth}
  ).then((http.Response response) {
    body2 = json.decode(response.body.toString());
  });
  return body2;
}

Future<dynamic> notificacions() async {
  String username = 'app';
  String password = 'pdB9z)fD!KL&5Xzs*@AX3!rE';
  String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  var url ='http://cbbalaguer.cat/wp-json/wp/v2/notifications';
  const JsonCodec json = JsonCodec();
  var body2;
  final response = await http.Client().get(Uri.parse(url),
      headers: {"Accept": "application/json", "authorization": basicAuth}
  ).then((http.Response response) {
    body2 = json.decode(response.body.toString());
  });
  return body2;
}