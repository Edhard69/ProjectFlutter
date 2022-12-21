import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:project1/screens/carnet-soci-screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaginaFerteSoci extends StatefulWidget {
  @override
  _PaginaFerteSociState createState() => _PaginaFerteSociState();
}
class _PaginaFerteSociState extends State<PaginaFerteSoci> {
  GlobalKey<FormState> keyForm = GlobalKey();
  final nomController = TextEditingController();
  final cognomsController = TextEditingController();
  final telefonController = TextEditingController();
  final correuController = TextEditingController();
  final contrasenyaController = TextEditingController();
  final contrasenyaRepController = TextEditingController();
  final quantitatController = TextEditingController();
  final ibanController = TextEditingController();


  static const colorPpal = Colors.red;
  bool carnet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fer-te Soci"),
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
        child: Form(
          key: keyForm,
          child: formUI(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.notifications_on),
              iconColor: colorPpal,
              shape: const Border(
                top: BorderSide(
                    width: 1,
                    color: colorPpal,
                    style: BorderStyle.solid
                ),
                bottom: BorderSide(
                    width: 1,
                    color: colorPpal,
                    style: BorderStyle.solid
                ),
              ),
              title: const Text('Notificacions'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaNotificacions');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              iconColor: colorPpal,
              shape: const Border(
                bottom: BorderSide(
                    width: 1,
                    color: colorPpal,
                    style: BorderStyle.solid
                ),
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
              shape: const Border(
                bottom: BorderSide(
                    width: 1,
                    color: colorPpal,
                    style: BorderStyle.solid
                ),
              ),
              title: const Text('Resultats'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaResultats');
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              iconColor: colorPpal,
              shape: const Border(
                bottom: BorderSide(
                    width: 1,
                    color: colorPpal,
                    style: BorderStyle.solid
                ),
              ),
              title: const Text('Patrocinadors'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaPatrocinadors');
              },
            ),
            ListTile(
              leading: const Icon(Icons.discount),
              iconColor: colorPpal,
              shape: const Border(
                bottom: BorderSide(
                    width: 1,
                    color: colorPpal,
                    style: BorderStyle.solid
                ),
              ),
              title: const Text('Descomptes i Serveis'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaDescomptesIServeis');
              },
            ),
            ListTile(
              leading: const Icon(Icons.newspaper),
              iconColor: colorPpal,
              shape: const Border(
                bottom: BorderSide(
                    width: 1,
                    color: colorPpal,
                    style: BorderStyle.solid
                ),
              ),
              title: const Text('Noticies'),
              onTap: () {
                Navigator.pushNamed(context, '/paginaNoticies');
              },
            ),
            InkWell(
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
          ],
        ),
      ),
    );
  }
  formItemsDesign(icon, item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Card(child: ListTile(title: item)),
    );
  }
  String money = 'hombre';
  static const midaIcona = 40.0;
  static const colorIcona = Colors.red;
  static const espais = SizedBox(height: 20);
  bool caixaText = false;
  bool focusBool = true;
  int preu = 0;
  bool _visibilitat = false;
  bool _visibilitatRep = false;
  Widget formUI() {
    return Column(
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
        Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 20.0),
        child: TextFormField(
            controller: nomController,
            validator: (value) {
              String pattern = r'(^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$)';
              RegExp regExp = RegExp(pattern);
              if (value!.isEmpty) {
                return "Omplenar";
              }else if(!regExp.hasMatch(value)){
                return "El nom és incorrecte";
              }
              return null;
            },
            decoration: const InputDecoration(
                icon: Icon(Icons.person, color: colorIcona, size: midaIcona),
                labelText: "Nom",
                border: OutlineInputBorder()
            ),
          ),
        ),
        espais,
        Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 20.0),
        child: TextFormField(
            controller: cognomsController,
            validator: (cognoms) {
              String pattern = r'(^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$)';
              RegExp regExp = RegExp(pattern);
              if (cognoms!.isEmpty) {
                return "Omplenar";
              }else if(!regExp.hasMatch(cognoms)){
                return "Els cognoms són incorrectes";
              }
              return null;
            },
            decoration: const InputDecoration(
                icon: Icon(Icons.abc_sharp, color: colorIcona, size: midaIcona),
                labelText: "Cognoms",
                border: OutlineInputBorder()
            ),
          ),
        ),
        espais,
        Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: TextFormField(
              controller: telefonController,
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
        ),
        espais,
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: TextFormField(
            controller: correuController,
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
                border: OutlineInputBorder()
            ),
          ),
        ),
        espais,
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: TextFormField(
            obscureText: !_visibilitat,
            controller: contrasenyaController,
            validator: (contrasenya) {
              if (contrasenya!.isEmpty) {
                return "Omplenar";
              }else if(contrasenya.length < 8){
                return "Contrasenya curta";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _visibilitat
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: colorPpal,
                  ),
                  onPressed: () {
                    setState(() {
                      _visibilitat = !_visibilitat;
                    });
                  },
                ),
                icon: const Icon(Icons.lock, color: colorIcona, size: midaIcona),
                labelText: "Contrasenya",
                border: const OutlineInputBorder()
            ),
          ),
        ),
        espais,
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: TextFormField(
            obscureText: !_visibilitatRep,
            controller: contrasenyaRepController,
            validator: (contrasenya) {
              if (contrasenya!.isEmpty) {
                return "Omplenar";
              }else if(contrasenya != contrasenyaController.text){
                return "Contrasenyes diferents";
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _visibilitatRep
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: colorPpal,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _visibilitatRep = !_visibilitatRep;
                    });
                  },
                ),
                icon: const Icon(Icons.lock, color: colorIcona, size: midaIcona),
                labelText: "Repetir contrasenya",
                border: const OutlineInputBorder()
            ),
          ),
        ),
        espais,
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.monetization_on_outlined, color: colorIcona, size: 30.0),
              label: const Text("Quina quantitat vols donar com a soci?",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              )
          ),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                flex: 10,
                  child: RadioListTile<String>(
                    title: const Text('20 €'),
                    value: '20',
                    groupValue: money,
                    onChanged: (value) {
                      setState(() {
                        money = value!;
                        quantitatController.text = "€";
                        focusBool = true;
                        caixaText = false;
                      });
                    },
                  ),
                ),
              ]
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: RadioListTile<String>(
                    title: const Text('50 €'),
                    value: '50',
                    groupValue: money,
                    onChanged: (value) {
                      setState(() {
                        money = value!;
                        quantitatController.text = "€";
                        focusBool = true;
                        caixaText = false;
                      });
                    },
                  ),
                ),
              ]
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: RadioListTile<String>(
                    title: const Text('100 €'),
                    value: '100',
                    groupValue: money,
                    onChanged: (value) {
                      setState(() {
                        money = value!;
                        quantitatController.text = "€";
                        focusBool = true;
                        caixaText = false;
                      });
                    },
                  ),
                ),
              ]
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox.fromSize(
                            size: const Size(190, 80),
                            child: RadioListTile<String>(
                              title: const Text('Altra quantitat'),
                              value: '5',
                              groupValue: money,
                              onChanged: (value) {
                                setState(() {
                                  money = value!;
                                  quantitatController.text = value;
                                  focusBool = false;
                                  caixaText = true;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0, right: 80.0),
                              child: TextFormField(
                                enableInteractiveSelection: caixaText,
                                focusNode: focusBool? AlwaysDisabledFocusNode() : null,
                                controller: quantitatController,
                                validator: (valor) {
                                  if(quantitatController.text=="€"){
                                    preu = int.parse(money);
                                  }else{
                                    try{
                                      preu = int.parse(quantitatController.text);
                                    }catch (e){
                                      return "Incorrecte";
                                    }
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    labelText: "€",
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                    border: OutlineInputBorder()
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
              ]
            ),
          ]
        ),
        espais,
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: TextFormField(
            controller: ibanController,
            validator: (iban) {
              String pattern =
                  'ES[a-zA-Z0-9]{2}\s?([0-9]{4}\s?){5}\s?';
              RegExp regExp = RegExp(pattern);
              if (iban!.isEmpty) {
                return "Omplenar";
              }
              else if(!regExp.hasMatch(iban) || iban.length != 24){
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
        ),
        espais,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                child: const Text("Registrar-se"),
                onPressed: (){
                  if(keyForm.currentState!.validate()){
                    enviarEmail(correuController.text, nomController.text, cognomsController.text);
                    registrarse(
                        nomController.text,
                        cognomsController.text,
                        telefonController.text,
                        correuController.text,
                        contrasenyaController.text,
                        preu,
                        ibanController.text
                    ).then((value) => {
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
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ElevatedButton(
                  child: const Text("Ja estic registrat"),
                  onPressed: (){
                    Navigator.pushNamed(context, '/paginaLogin');
                  }
              ),
            ),
          ],
        ),
        espais,
      ],
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Future<String> enviarEmail(String email, String nom, String cognoms) async {
  final smtpServer = SmtpServer(
    "mail.compsaonline.com",
    port: 465,
    ssl: true,
    ignoreBadCertificate: false,
    allowInsecure: false,
    username: "web2@compsaonline.com",
    password: "otZdkeENM975",
  );
  // Create our message.
  final message = Message()
    ..from = const Address("web2@compsaonline.com", "web2@compsaonline.com")
    ..recipients.add(email)
    ..subject = 'Nou registre CB Balaguer'
    ..text = "Gracies per registrarte a la aplicació de CB Balaguer $cognoms, $nom";
  try {
    final sendReport = await send(message, smtpServer);
    return "Ben aviat contactarem amb tu!";
  } on MailerException catch (e) {
    print(e.message);
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
    return "Hi ha hagut un error al enviar el correu, torna-ho a intentar";
  }
}

Future<dynamic> registrarse(String nomUser, String cognomsUser, String telefonUser, String correuUser, String contrasenyaUser, int preuUser, String ibanUser) async {
  String username = 'app';
  String password = 'pdB9z)fD!KL&5Xzs*@AX3!rE';
  String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  var url ='http://cbbalaguer.cat/wp-json/wp/v2/users/register';
  const JsonCodec json = JsonCodec();
  var body2 = null;
  var body = jsonEncode({"email": correuUser,"name": nomUser,"lastname": cognomsUser,"phone": telefonUser,"password": contrasenyaUser,"qty": preuUser,"iban": ibanUser});
  final response = await http.Client().post(Uri.parse(url),
      headers: {"Accept": "application/json", "authorization": basicAuth, "Content-Type": "application/json"},
      body: body).then((http.Response response) async {
    body2 = json.decode(response.body.toString());
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('idUser',body2["message"]);
  });
  return body2["message"];
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