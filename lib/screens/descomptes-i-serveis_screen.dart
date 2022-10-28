import 'package:flutter/material.dart';

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
            icon: new Icon(Icons.home),
            iconSize: 30,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: PageView(
        children: const [
          CustomScreen( color: Colors.white ),
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
              leading: const Icon(Icons.sports_basketball),
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
              margin: EdgeInsets.only(top: 270),
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
  final Color color;
  const CustomScreen({super.key,  required this.color });

  static const marginImatges = 5.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(children: <Widget>[
          Row(//ROW 1
            children: [
              Container(
                height: 50.0,
                width: 200,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage('lib/image/logoCompsa.png'),
                  ),
                ),
              ),
              Container(
                height: 110.0,
                width: 200.0,
                child: Column(
                  children: const [
                    Text(
                        "www.compsaonline.com",
                        style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "Condicions especials per als socis (i familiars directes dels socis) del Club Bàsquet Balaguer",
                        textAlign: TextAlign.center,
                    ),
                    Text(
                        "DESCOMPTE DEL 5%",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(//ROW 2
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 110.0,
                  width: 180,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/diputacio_lleida.jpg'),
                      //scale: 1,
                    ),
                  ),
                ),
                Container(
                  height: 110.0,
                  width: 160,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/logofarre.gif'),
                      //scale: 1,
                    ),
                  ),
                ),
              ]),
          Row(// ROW 3
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 110.0,
                  width: 170,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/logodissenyviatges.png'),
                      //scale: 1,
                    ),
                  ),
                ),
                Container(
                  height: 110.0,
                  width: 120.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/logo.jpg'),
                      //scale: 1,
                    ),
                  ),
                ),
              ]),
          Row(// ROW 4
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 110.0,
                  width: 190,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/fcbq.jpg'),
                      //scale: 1,
                    ),
                  ),
                ),
                Container(
                  height: 110.0,
                  width: 160,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/esportcat.png'),
                      //scale: 1,
                    ),
                  ),
                ),
              ]),
          Row(// ROW 5
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/consell_comarcal.jpg'),
                      //scale: 1,
                    ),
                  ),
                ),
                Container(
                  height: 110.0,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/logomena.gif'),
                      //scale: 1,
                    ),
                  ),
                ),
              ]),
        ]
        )
    );
  }
}
