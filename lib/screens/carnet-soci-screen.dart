import 'package:flutter/material.dart';

class CarnetSociScreen extends StatelessWidget {
  final String nom;
  final String cognoms;
  final String correu;
  const CarnetSociScreen(this.nom, this.cognoms, this.correu, {super.key});

  static const ampladaEsquerra = Padding(
    padding: EdgeInsets.only(left: 70.0),
  );
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
      body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
                      child: const Text(
                        "Aquest és el teu carnet de soci",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/image/soci-club-basquet.png'),

                        ),
                      ),
                      child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 160.0,
                            ),
                            Column(
                                children: <Widget>[
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        ampladaEsquerra,
                                        const SizedBox(
                                          width: midaCamps1,
                                          height: 20.0,
                                          child: Text(
                                            "Nom:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: midaLletra, color: colorLletra, letterSpacing: espaiLletres),
                                          ),
                                        ),
                                        SizedBox(
                                          width: midaCamps2,
                                          height: 20.0,
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
                                          height: 20.0,
                                          child: Text(
                                            "Cognoms:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: midaLletra, color: colorLletra, letterSpacing: espaiLletres),
                                          ),
                                        ),
                                        SizedBox(
                                          width: midaCamps2,
                                          height: 20.0,
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
                                          height: 20.0,
                                          child: Text(
                                            "Correu:",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: midaLletra, color: colorLletra, letterSpacing: espaiLletres),
                                          ),
                                        ),
                                        SizedBox(
                                          width: midaCamps2,
                                          height: 20.0,
                                          child: Text(
                                            correu,
                                            style: const TextStyle(fontSize: midaLletra, color: colorLletra),
                                          ),
                                        ),
                                      ]
                                  ),
                                ]
                            ),



                          ]
                      ),
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