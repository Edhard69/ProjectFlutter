import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CarnetSociScreen extends StatelessWidget {
  final String nom;
  final String cognoms;
  final String correu;
  final int id;
  const CarnetSociScreen(this.nom, this.cognoms, this.correu, this.id, {super.key});


  static const ampladaEsquerra = Padding(
    padding: EdgeInsets.only(left: 20.0),
  );
  static const colorPpal = Colors.red;
  static const midaCamps1 = 70.0;
  static const midaCamps2 = 200.0;
  static const midaLletra = 14.0;
  static const colorLletra = Colors.white;
  static const espaiLletres = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Carnet de Soci"),
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
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: const Text(
                        "Aquest és el teu carnet de soci",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/soci-club-basquet.png'),
                        ),
                      ),
                      child: Column(
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 148.0,
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ampladaEsquerra,
                                        const SizedBox(
                                          width: midaCamps1,
                                          height: 18.0,
                                          child: Text(
                                            "Id:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: midaLletra, color: colorLletra, letterSpacing: espaiLletres),
                                          ),
                                        ),
                                        SizedBox(
                                          width: midaCamps2,
                                          height: 18.0,
                                          child: Text(
                                            id.toString(),
                                            style: const TextStyle(fontSize: midaLletra, color: colorLletra),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ampladaEsquerra,
                                        const SizedBox(
                                          width: midaCamps1,
                                          height: 18.0,
                                          child: Text(
                                            "Nom:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: midaLletra, color: colorLletra, letterSpacing: espaiLletres),
                                          ),
                                        ),
                                        SizedBox(
                                          width: midaCamps2,
                                          height: 18.0,
                                          child: Text(
                                            nom,
                                            style: const TextStyle(fontSize: midaLletra, color: colorLletra),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ampladaEsquerra,
                                        const SizedBox(
                                          width: midaCamps1,
                                          height: 18.0,
                                          child: Text(
                                            "Cognoms:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: midaLletra, color: colorLletra, letterSpacing: espaiLletres),
                                          ),
                                        ),
                                        SizedBox(
                                          width: midaCamps2,
                                          height: 18.0,
                                          child: Text(
                                            cognoms,
                                            style: const TextStyle(fontSize: midaLletra, color: colorLletra),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ampladaEsquerra,
                                        const SizedBox(
                                          width: midaCamps1,
                                          height: 18.0,
                                          child: Text(
                                            "Correu:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: midaLletra, color: colorLletra, letterSpacing: espaiLletres),
                                          ),
                                        ),
                                        SizedBox(
                                          width: midaCamps2,
                                          height: 18.0,
                                          child: Text(
                                            correu,
                                            style: const TextStyle(fontSize: midaLletra, color: colorLletra),
                                          ),
                                        ),
                                      ]
                                  ),
                                ],
                            ),
                          ]
                      ),
                    ),
                    ElevatedButton(
                      child: const Text("Desloguejarte"),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove("idUser");
                        Navigator.pushNamed(context, '/');
                      }
                    ),
                  ],
                ),
              )
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