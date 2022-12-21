import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class PaginaDescomptesIServeis extends StatefulWidget {
  @override
  _PaginaDescomptesIServeisState createState() => _PaginaDescomptesIServeisState();
}

class _PaginaDescomptesIServeisState extends State<PaginaDescomptesIServeis> {

  static const colorPpal = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Descomptes i Serveis"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: PageView(
        children: const [
          CustomScreen(),
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
              onTap: () {
                Navigator.pushNamed(context, '/paginaFerteSoci');
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
            Container(
              margin: const EdgeInsets.only(top: 270),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Column(
                  children: const <Widget>[
                    Icon(
                      Icons.home,
                      size: 40.0,
                      color: colorPpal,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomScreen extends StatelessWidget {
  const CustomScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: WebView(
        zoomEnabled: false,
        initialUrl: 'https://cbbalaguer.cat/descomptes-i-serveis/',
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