import 'package:CFP_GETECH/contact.dart';
import 'package:CFP_GETECH/departement.dart';
import 'package:CFP_GETECH/formation.dart';
import 'package:CFP_GETECH/menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.teal),
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //A chaque onj peut ajouter un menu directement ici
  final menu = [
    {'title': 'Home', 'icon': Icon(Icons.home), 'page': Departement()},
    {'title': 'Départements', 'icon': Icon(Icons.account_tree), 'page': Departement()},
    {'title': 'Formations', 'icon': Icon(Icons.work), 'page': Formation()},
    {'title': 'Contacts', 'icon': Icon(Icons.contact_mail), 'page': Contact()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Center(
        child: Text("Page Accueil"),
      ),
      drawer: Drawer(
        //child pour dire 1 seul élément
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  //pour que l'appli charge l'image il faut le préciser dans le fichier pubspec.lock
                  // et à chaque fois qu'on a une nouvelle librairie ou une dépendance il faut l'ajouter dans ce fichier
                  backgroundImage: AssetImage("./images/logo_cfp_getech.png"),
                  radius: 50, //pour la taille de l'image
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.teal, Colors.green //green
              ])),
            ),
            //Ceci permet d'ajouter facilement d'autres éléments dans le menus
            //quand on cré un map sur un attribut il faut créer une copie de l'attribut avec ...
            ...this.menu.map((item) {
              return new Column(
                children: [
                  Menu(item['title'], item['icon'], (context) {
                    // pour afficher la page précédente (retour)
                    //Navigator.pop(context)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => item['page']));
                  }),
                  Divider(color: Colors.teal,),//pour créer une ligne de séparation
                ],
              );

            })
          ],
        ),
      ),
    );
  }
}
