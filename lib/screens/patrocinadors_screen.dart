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
    return Row(
      children: <Widget>[
        Container(
          height: 20.0,
          width: 40.0,
          margin: const EdgeInsets.only(top: 40.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/image/Caprabo.jpg'),
              //scale: 1,
            ),
          ),
        ),
        Container(
          height: 20.0,
          width: 40.0,
          margin: const EdgeInsets.only(top: 40.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/image/logocbbalaguer.png'),
              //scale: 1,
            ),
          ),
        ),
        Container(
          height: 20.0,
          width: 40.0,
          margin: const EdgeInsets.only(top: 40.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/image/logocbbalaguer.png'),
              //scale: 1,
            ),
          ),
        ),
      ],
    );
  }
}
