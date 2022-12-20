import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:project1/screens/carnet-soci-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}
class _PaginaLoginState extends State<PaginaLogin> {
  GlobalKey<FormState> keyForm = GlobalKey();
  final correuController = TextEditingController();
  final contrasenyaController = TextEditingController();
  static const colorPpal = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
              onTap: () {
                Navigator.pushNamed(context, '/paginaFerteSoci');
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
  static const midaIcona = 40.0;
  static const colorIcona = Colors.red;
  static const espais = SizedBox(height: 20);
  bool _visibilitat = false;
  Widget formUI() {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Text(
            "Loguejat!",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
          child: TextFormField(
            controller: correuController,
            validator: (correu) {
              if (correu!.isEmpty) {
                return "Omplenar";
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
                border: OutlineInputBorder()
            ),
          ),
        ),
        espais,
        ElevatedButton(
          child: const Text("Login"),
          onPressed: () async {
            var prefs = await SharedPreferences.getInstance();
            if(keyForm.currentState!.validate()){
              print("Guardar");
              print(correuController.text);
              print(contrasenyaController.text);
              String msg;
              login(correuController.text, contrasenyaController.text).then(
                  (value) => {
                    if(prefs.getInt("idUser")!=null){
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
                    }else{
                      print("error"),
                      msg = value.toString(),
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context,msg),
                      ),
                    }
                  }
              );
            }
          },
        ),
        espais,
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context,msg) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(
          data: msg
        ),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Tancar'),
      ),
    ],
  );
}



class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

Future<dynamic> login(String emailUser, String passwordUser) async {
  String username = 'app';
  String password = 'pdB9z)fD!KL&5Xzs*@AX3!rE';
  String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  var url ='http://cbbalaguer.cat/wp-json/wp/v2/users/login';
  const JsonCodec json = JsonCodec();
  var body2;
  var body = jsonEncode({"email": emailUser,"password": passwordUser});
      final response = await http.Client().post(Uri.parse(url),
          headers: {"Accept": "application/json", "authorization": basicAuth, "Content-Type": "application/json"},
      body: body).then((http.Response response) async {
    body2 = json.decode(response.body.toString());
    final prefs = await SharedPreferences.getInstance();
    if(body2["code"]==200 || body2["code"]=="200"){
      prefs.setInt('idUser',body2["message"]);
    }
  });
  return body2["message"];
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
