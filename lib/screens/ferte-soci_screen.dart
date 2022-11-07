import 'package:flutter/material.dart';

class PaginaFerteSoci extends StatefulWidget {
  @override
  _PaginaFerteSociState createState() => _PaginaFerteSociState();
}

class _PaginaFerteSociState extends State<PaginaFerteSoci> {

  static const colorPpal = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fer-te Soci"),
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
      body: Container(
        child: _FormSave(),
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

class _FormSave extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  static const midaIcona = 40.0;
  static const colorIcona = Colors.red;
  static const espais = SizedBox(height: 20);
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                  "Registra't!",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
              ),
            ),
            TextFormField(
              //maxLength: 0,
              //maxLines: 0,
              validator: (nom) {
                String pattern = r'(^[a-zA-Z ]*$)';
                RegExp regExp = RegExp(pattern);
                if (nom!.isEmpty) {
                  return "Omplenar";
                }else if(!regExp.hasMatch(nom)){
                  return "El nom ha de ser a-z y A-Z";
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: colorIcona, size: midaIcona),
                  labelText: "Nom",
                  border: OutlineInputBorder()
              ),
            ),
            espais,
            TextFormField(
              validator: (cognoms) {
                String pattern = r'(^[a-zA-Z ]*$)';
                RegExp regExp = RegExp(pattern);
                if (cognoms!.isEmpty) {
                  return "Omplenar";
                }else if(!regExp.hasMatch(cognoms)){
                  return "Els cognoms han de ser a-z y A-Z";
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.abc_sharp, color: colorIcona, size: midaIcona),
                  labelText: "Cognoms",
                  border: OutlineInputBorder()
              ),
            ),
            espais,
            TextFormField(
              validator: (telefon) {
                String pattern = r'(^[0-9]*$)';
                RegExp regExp = RegExp(pattern);
                if (telefon!.isEmpty) {
                  return "Omplenar";
                }else if (!regExp.hasMatch(telefon)) {
                  return "Ha de ser un numero de telefon 0-9";
                }else if (telefon.length != 9) {
                  return "El numero ha de tenir 9 digits";
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.phone, color: colorIcona, size: midaIcona),
                  labelText: "Telèfon",
                  border: OutlineInputBorder()
              ),
            ),
            espais,
            TextFormField(
              validator: (correu) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);
                if (correu!.isEmpty) {
                  return "Omplenar";
                }else if(!regExp.hasMatch(correu)){
                  return "Correu incorrecte";
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.mail, color: colorIcona, size: midaIcona),
                  labelText: "Correu",
                  fillColor: Colors.yellow,
                  hoverColor: Colors.yellow,
                  focusColor: Colors.yellow,
                  border: OutlineInputBorder()
              ),
            ),
            espais,
            TextFormField(
              validator: (iban) {
                String pattern =
                'ES[a-zA-Z0-9]{2}\s?([0-9]{4}\s?){5}\s?';
                RegExp regExp = RegExp(pattern);
                if (iban!.isEmpty) {
                  return "Omplenar";
                }else if(!regExp.hasMatch(iban) || iban.length != 24){
                  return "Iban incorrecte";
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.credit_card, color: colorIcona, size: midaIcona),
                  labelText: "IBAN",
                  border: OutlineInputBorder()
              ),
            ),
            espais,
            ElevatedButton(
                child: Text("Registrar-se"),
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    print("Guardar");
                  }
                },
            ),
            espais,
            Container(
              width: 380.0,
              height: 200.0,
              decoration: BoxDecoration(
                    border: Border.all(color: Colors.red.shade900, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                ),

              child: Row(
                  children: <Widget>[
                    Container(
                      width: 350.0,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/image/logocbbalaguer.png'),
                          //scale: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: 350.0,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/image/logocbbalaguer.png'),
                          //scale: 1,
                        ),
                      ),
                    ),
                  ]
              )
            ),
            espais,

          ],
        ),
      ),
    );
  }
}