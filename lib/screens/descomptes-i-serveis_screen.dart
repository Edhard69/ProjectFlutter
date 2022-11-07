import 'package:flutter/cupertino.dart';
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
  final Color color;
  const CustomScreen({super.key,  required this.color });

  static const ampleImatge = 180.0;
  static const alcadaImatge = 100.0;
  static const ampleText = 220.0;
  static const alcadaText = 100.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(children: <Widget>[
          Row(//ROW 1
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 400,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Colors.red.shade900,
                          style: BorderStyle.solid
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 2.0, right: 2.0),
                          child: Text.rich(
                              TextSpan(
                                text: 'Els ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                children: <TextSpan>[

                                  TextSpan(
                                      text: 'socis ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      )
                                  ),
                                  TextSpan(
                                      text: 'del Club Bàsquet Balaguer tenen ',
                                  ),
                                  TextSpan(
                                      text: 'dret a gaudir de descomptes en serveis i productes ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      )
                                  ),
                                  TextSpan(
                                    text: 'de les marques que enguany patrocinen els diferents '
                                        'equips del club'
                                  ),
                                  // can add more TextSpans here...
                                ],
                              ),
                            )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(//ROW 2
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: ampleImatge,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/image/logoCompsaFons.png'),
                  ),
                ),
              ),
              SizedBox(
                height: alcadaText,
                width: ampleText,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "www.compsaonline.com",
                        style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "Condicions especials per als socis (i familiars directes dels socis) del Club Bàsquet Balaguer",
                        textAlign: TextAlign.center,
                    ),
                    Text(
                        "DESCOMPTE DEL 5%",
                        style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(//ROW 3
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: alcadaImatge,
                width: ampleImatge,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/image/Caprabo.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: alcadaText,
                width: ampleText,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "www.caprabo.com",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Condicions especials per als socis (i familiars directes dels socis) del Club Bàsquet Balaguer",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "DESCOMPTE DEL 5%",
                      style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(//ROW 4
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: alcadaImatge,
                width: ampleImatge,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/image/logofarre.gif'),
                  ),
                ),
              ),
              SizedBox(
                height: alcadaText,
                width: ampleText,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "www.gammafarre.com",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Condicions especials per als socis (i familiars directes dels socis) del Club Bàsquet Balaguer",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "DESCOMPTE DEL 10%",
                      style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(//ROW 5
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: alcadaImatge,
                width: ampleImatge,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/image/logomena.gif'),
                  ),
                ),
              ),
              SizedBox(
                height: alcadaText,
                width: ampleText,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "www.comercialmena.com",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Condicions especials per als socis (i familiars directes dels socis) del Club Bàsquet Balaguer",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "DESCOMPTE DEL 8%",
                      style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(//ROW 6
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: alcadaImatge,
                width: ampleImatge,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/image/logodissenyviatges.png'),
                  ),
                ),
              ),
              SizedBox(
                height: alcadaText,
                width: ampleText,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "www.dissenyviatges.com",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Condicions especials per als socis (i familiars directes dels socis) del Club Bàsquet Balaguer",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "DESCOMPTE DEL 5%",
                      style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]
        )
    );
  }
}
