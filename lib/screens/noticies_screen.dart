import 'package:flutter/material.dart';

class PaginaNoticies extends StatefulWidget {
  @override
  _PaginaNoticiesState createState() => _PaginaNoticiesState();
}

class _PaginaNoticiesState extends State<PaginaNoticies> {

  static const colorPpal = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noticies"),
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

  static const ampleImatge = 200.0;
  static const alcadaImatge = 200.0;
  static const ampleText = 190.0;
  static const alcadaText = 180.0;
  static const paddingTopTxt = Padding(
    padding: EdgeInsets.only(top: 20.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: alcadaImatge,
                      width: ampleImatge,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://scontent-mad1-1.cdninstagram.com/v/t51.2885-15/315542596_806189307120088_1760259967780778299_n.webp?stp=dst-jpg_e35&_nc_ht=scontent-mad1-1.cdninstagram.com&_nc_cat=104&_nc_ohc=k2zRlsniCG8AX_QYBby&tn=bJdL6Mh23wF71kkd&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=Mjk3MTE2MDYxMTYyNzg3NTQwMw%3D%3D.2-ccb7-5&oh=00_AfCyWPyiFjgazNcCO3DxhF_pUr-k9Yv7r1l-l5nYPLsi_Q&oe=637BF34D&_nc_sid=30a2ef"),
                              fit: BoxFit.cover)
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    SizedBox(
                      height: alcadaText,
                      width: ampleText,
                      child: Column(
                        children: const [
                          paddingTopTxt,
                          Text(
                            "🎭SOM VENCIBLES🎭",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                          ),
                          Text(
                            "Per primer cop aquesta temporada, el primer equip masculí va conèixer la derrota, en canvi el femení segueix intractable.",
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: 410,
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
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: alcadaImatge,
                      width: ampleImatge,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://scontent-mad1-1.cdninstagram.com/v/t51.2885-15/302101067_167249545990141_9148211133100069079_n.webp?stp=dst-jpg_e35&_nc_ht=scontent-mad1-1.cdninstagram.com&_nc_cat=101&_nc_ohc=kSQkOalD-PUAX_r0keh&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=Mjk3Mjg3NTI4MTkwNjAxNzE4NQ%3D%3D.2-ccb7-5&oh=00_AfCaHaiiAWd4Do02uxq7kyrw5JWmvwCiaNC3cybXI23BMg&oe=637D0A79&_nc_sid=30a2ef"),
                              fit: BoxFit.cover)
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    SizedBox(
                      height: alcadaText,
                      width: ampleText,
                      child: Column(
                        children: const [
                          paddingTopTxt,
                          Text(
                            "🏀TECNIFICACIONS IN ENGLISH🏀",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                          ),
                          Text(
                            "Nova tanda d'entrenaments en anglès a cárrec de jugadors i entrenadors del @teixidoassossiats. Ves a la web, informa't i omple el formulari d'inscripció!",
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: 410,
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
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: alcadaImatge,
                      width: ampleImatge,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://scontent-mad1-1.cdninstagram.com/v/t51.2885-15/315918690_682393686940480_3636918974981145038_n.webp?stp=dst-jpg_e35&_nc_ht=scontent-mad1-1.cdninstagram.com&_nc_cat=104&_nc_ohc=7eBaiWg3J4IAX97WSJe&edm=ALQROFkBAAAA&ccb=7-5&ig_cache_key=Mjk3MzUxMzg1Mjk0MDMyMTYyOA%3D%3D.2-ccb7-5&oh=00_AfDo_dkzAk7bvCFo0s5bjWmnGNW15RHYSRcigJMWYrlxAQ&oe=637BF8B6&_nc_sid=30a2ef"),
                              fit: BoxFit.cover)
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    ),
                    SizedBox(
                      height: alcadaText,
                      width: ampleText,
                      child: Column(
                        children: const [
                          paddingTopTxt,
                          Text(
                            "🤝🏽PAVIMENTS LA NOGUERA 2015 CB BALAGUER🤝🏽",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                          ),
                          Text(
                            "Un patrocinador habitual del club, Paviments La Noguera 2015 continua un any més vinculat al club patrocinant al premini femení. Moltes gràcies!",
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 5.0),
                    ),
                  ],
                ),
              ]
            )
        )
    );
  }
}

