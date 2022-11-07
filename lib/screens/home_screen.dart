import 'package:flutter/material.dart';

class PaginaPpal extends StatefulWidget {
  @override
  _PaginaPpalState createState() => _PaginaPpalState();
}

class _PaginaPpalState extends State<PaginaPpal> {

  static const midaCaixa = Size(137, 120);
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
                            onTap: () {
                              Navigator.pushNamed(context, '/paginaFerteSoci');
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
              Navigator.pushNamed(context, '/paginaFerteSoci');
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
