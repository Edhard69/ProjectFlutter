import 'package:flutter/material.dart';
import 'package:project1/screens/home_screen.dart';
import 'package:project1/main.dart';

class PaginaPatrocinadors extends StatefulWidget {
  @override
  _PaginaPatrocinadorsState createState() => _PaginaPatrocinadorsState();
}

class _PaginaPatrocinadorsState extends State<PaginaPatrocinadors> {

  int currentPage = 0;

  static const midaCaixa = Size(137, 120);
  static const colorPpal = Colors.black;
  static const colorFonsIcones = Colors.blue;
  static const midaBordesCaixa = 1.0;
  static const midaBordesCaixaPuntsFebles = midaBordesCaixa+1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patrocinadors"),
        centerTitle: true,
      ),


      body: PageView(
        children: const [
          CustomScreen( color: Colors.white ),
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
                    SizedBox.fromSize(
                      size: midaCaixa,
                      child: Material(
                        color: colorFonsIcones,
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
                            onTap: () {},
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
                      ),
                    ),
                    SizedBox.fromSize(
                      size: midaCaixa,
                      child: Material(
                        color: colorFonsIcones,
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
                            onTap: () {},
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: midaCaixa,
                      child: Material(
                        color: colorFonsIcones,
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
                            onTap: () {},
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    SizedBox.fromSize(
                      size: midaCaixa,
                      child: Material(
                        color: colorFonsIcones,
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
                            onTap: () {},
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
                    SizedBox.fromSize(
                      size: midaCaixa,
                      child: Material(
                        color: colorFonsIcones,
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
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(
                                  Icons.sports_basketball,
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
                    SizedBox.fromSize(
                      size: midaCaixa,
                      child: Material(
                        color: colorFonsIcones,
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
                            onTap: () {},
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
                  ]),
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
                Navigator.pop(context);
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
                Navigator.pop(context);
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
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.sports_basketball),
              iconColor: colorPpal,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: colorPpal, width: 1),
              ),
              title: const Text('Descomptes i Serveis'),
              onTap: () {
                Navigator.pop(context);
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
                Navigator.pop(context);
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
    return Column(
      children: <Widget>[
        Container(
          height: 200.0,
          width: 400.0,
          margin: const EdgeInsets.only(top: 40.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/image/logocbbalaguer.png'),
              scale: 0.9,
            ),
          ),
        ),

        Container(
          width: 160.0,
          height: 40.0,
          margin: const EdgeInsets.only(left: 200.0,top: 10.0),
          color: Colors.white,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Text(
              "FES-TE SOCI!",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.red[900],

          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 200.0,top: 5.0),
            child: Column(
                children: const [
                  Text(
                    "TEMPORADA 2022/2023",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ]
            )
        ),
      ],
    );
  }
}
