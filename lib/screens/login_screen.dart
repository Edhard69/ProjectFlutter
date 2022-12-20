import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:project1/screens/carnet-soci-screen.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

int i=0;
wp.WordPress wordPress = wp.WordPress(
  baseUrl: 'https://cbbalaguer.cat/',
  authenticator: wp.WordPressAuthenticator.JWT,
  adminName: '',
  adminKey: '',
);
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
  String money = 'hombre';
  static const midaIcona = 40.0;
  static const colorIcona = Colors.red;
  static const espais = SizedBox(height: 20);
  bool caixaText = false;
  bool focusBool = true;
  int preu = 0;
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
              String pattern = r'(^[a-zA-Z ]*$)';
              RegExp regExp = RegExp(pattern);
              if (value!.isEmpty) {
                return "Omplenar";
              }else if(!regExp.hasMatch(value)){
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
        ),
        espais,
        Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 20.0),
        child: TextFormField(
            controller: cognomsController,
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
                                      return "Error";
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
        ElevatedButton(
          child: const Text("Registrar-se"),
          onPressed: (){
            if(keyForm.currentState!.validate()){
              enviarEmail(correuController.text);
              print("Guardar");
              print(nomController.text);
              print(cognomsController.text);
              print(telefonController.text);
              print(correuController.text);
              print(preu);
              print(ibanController.text);
              i++;

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CarnetSociScreen(
                            nomController.text,
                            cognomsController.text,
                            correuController.text,
                            i
                        )
                ),
              );
            }
          },
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

Future<String> enviarEmail(String email) async {
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
    ..recipients.add('eaguila@almata.cat')
    ..subject = 'Nou registre'
    ..text = "Gracies per registrarte";
  try {
    final sendReport = await send(message, smtpServer);
    return "Ben aviat contactarem amb tu!";
    //print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print(e.message);
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
    return "Hi ha hagut un error al enviar el correu, torna-ho a intentar";
  }
}




/*
void createPost(wp.User user) {
  final post = wordPress.createPost(
    post: new wp.Post(
      title: 'First post as a Chief Editor',
      content: 'Blah! blah! blah!',
      excerpt: 'Discussion about blah!',
      authorID: user.id,
      commentStatus: wp.PostCommentStatus.open,
      pingStatus: wp.PostPingStatus.closed,
      status: wp.PostPageStatus.publish,
      format: wp.PostFormat.standard,
      sticky: true,
    ),
  );

  post.then((p) {
    print('Post created successfully with ID: ${p.id}');
  }).catchError((err) {
    print('Failed to create post: $err');
  });
}
  Future<wp.User> response = wordPress.authenticateUser(
    username: 'cbbalaguer',
    password: '#SomCBB2019!',
  );

  response.then((user) {
    createPost(user);
  }).catchError((err) {
    print('Failed to fetch user: $err');
  });
*/
