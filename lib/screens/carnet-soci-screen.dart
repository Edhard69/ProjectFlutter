import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarnetSociScreen extends StatelessWidget {
  final String nom;
  final String cognoms;
  final String correu;
  final int id;
  const CarnetSociScreen(this.nom, this.cognoms, this.correu, this.id, {super.key});

  static const ampladaEsquerra = Padding(
    padding: EdgeInsets.only(left: 70.0),
  );
  static const midaCamps1 = 70.0;
  static const midaCamps2 = 150.0;
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
                          image: AssetImage('lib/image/soci-club-basquet.png'),
                        ),
                      ),
                      child: Column(
                          children: <Widget>[
                            Column(
                                children: <Widget>[
                                  const SizedBox(
                                    height: 150.0,
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