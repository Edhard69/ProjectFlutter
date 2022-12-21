import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project1/screens/carnet-soci-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PaginaPpal extends StatefulWidget {
  PaginaPpal();

  @override
  _PaginaPpalState createState() => _PaginaPpalState();
}

class _PaginaPpalState extends State<PaginaPpal> {

  static const colorPpal = Colors.red;
  static const colorFonsIcones = Colors.white;
  static const midaBordesCaixa = 1.0;
  static const midaBordesCaixaPuntsFebles = midaBordesCaixa+1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inici"),
          centerTitle: true,
        ),
      body: PageView(
        children: const [
          CustomScreen( color: Colors.red ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 240,
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Material(
                        color: colorFonsIcones,
                        child: SizedBox(
                          height: 120,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: midaBordesCaixaPuntsFebles,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                bottom: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                right: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/paginaNotificacions');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.notifications_on,
                                    size: 40.0,
                                    color: colorPpal,
                                  ),
                                  Text(
                                    "Notificacions",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Material(
                        color: colorFonsIcones,
                        child: SizedBox(
                          height: 120,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: midaBordesCaixaPuntsFebles,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                bottom: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                left: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                right: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: InkWell(
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    size: 40.0,
                                    color: colorPpal,
                                  ),
                                  Text(
                                    "Fer-te soci",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Material(
                        color: colorFonsIcones,
                          child: SizedBox(
                            height: 120,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: midaBordesCaixaPuntsFebles,
                                      color: colorPpal,
                                      style: BorderStyle.solid),
                                  bottom: BorderSide(
                                      width: midaBordesCaixa,
                                      color: colorPpal,
                                      style: BorderStyle.solid),
                                  left: BorderSide(
                                      width: midaBordesCaixa,
                                      color: colorPpal,
                                      style: BorderStyle.solid),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/paginaResultats');
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.content_paste_search,
                                      size: 40.0,
                                      color: colorPpal,
                                    ),
                                    Text(
                                      "Resultats",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      )
                    ),
                    ),
                  ]
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Material(
                        color: colorFonsIcones,
                        child: SizedBox(
                          height: 120,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                right: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/paginaPatrocinadors');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.people,
                                    size: 40.0,
                                    color: colorPpal,
                                  ),
                                  Text(
                                    "Patrocinadors",
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Material(
                        color: colorFonsIcones,
                        child: SizedBox(
                          height: 120,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                left: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                right: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/paginaDescomptesIServeis');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.discount,
                                    size: 40.0,
                                    color: colorPpal,
                                  ),
                                  Text(
                                    "Descomptes \ni serveis",
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Material(
                        color: colorFonsIcones,
                        child: SizedBox(
                          height: 120,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                                left: BorderSide(
                                    width: midaBordesCaixa,
                                    color: colorPpal,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/paginaNoticies');
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.newspaper,
                                    size: 40.0,
                                    color: colorPpal,
                                  ),
                                  Text(
                                    "Noticies",
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ]
              ),
            ],
          ),
        ),
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
          ],
        ),
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {

  final Color color;
  const CustomScreen({super.key,  required this.color });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 160.0,
              margin: const EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/image/logocbbalaguer.png'),
                  scale: 1,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              height: 0,
              child: Container(
                height: 40,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 30.0),
                child: FloatingActionButton.extended(
                  onPressed: () async {
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
                  label: const Text(
                    "FES-TE SOCI!",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),
                  ),
                  backgroundColor: Colors.red[900],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              height: 60,
              child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 35.0, top: 5.0),
                  child: Column(
                      children: const [
                        Text(
                          "TEMPORADA 2022/2023",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ]
                  )
              ),
            ),
          ],
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