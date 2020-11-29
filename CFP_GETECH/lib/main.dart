import 'package:CFP_GETECH/formCandidat.dart';
import 'package:CFP_GETECH/contact.dart';
import 'package:CFP_GETECH/departement.dart';
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
    {
      'title': 'Départements',
      'icon': Icon(Icons.account_tree),
      'page': Departement()
    },
    //{'title': 'Formations', 'icon': Icon(Icons.work), 'page': Formation()},
    {'title': 'Contacts', 'icon': Icon(Icons.contact_mail), 'page': Contact()},
  ];

  //==================================================================
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                //padding: const EdgeInsets.all(32),
                child: Center(
                  child: Text(
                        'Centre de Formation Professionnelle \n '
                        'Gestion et Technologie',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            fontSize: 15,
                          color: Colors.teal,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                ),
                ),
              // Container(
              //   padding: const EdgeInsets.only(bottom: 8),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.auto_stories,
              //         color: Colors.red[500],
              //       ),
              //       Text('Des formations de qualité'),
              //     ],
              //   ),
              // ),

            ],
          ),
        ),
        /*3*/
      ],
    ),
  );
  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Le centre de formation professionnelle de la commune de Tattaguine a, '
      'en fonction des objectifs visés, pour vision de rendre accessible '
      'les formations délivrées par les meilleurs écoles du Sénégal avec '
      'la même qualité. Cela passe par un contenu pédagogique de qualité, '
      'un corps professoral engagé, dynamique et prêt à offrir le meilleur '
      'de lui même pour transmettre ses connaissances et ses méthodes pédagogiques. '
      'Ce personnel pédagogique sera aussi accompagné par des formations de renforcement de capacité.',
      softWrap: true,
      textAlign: TextAlign.justify,
    ),
  );

  //===========================================
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  //======================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CFP-GETECH"),
        ),
      ),
      // body: Center(
      //   child: Text("Page Accueil"),
      // ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/CFP_GETECH.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          titleSection,
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // RaisedButton(
                //     Theme.of(context).primaryColor, Icons.call, 'CALL'),
                // _buildButtonColumn(
                //     Theme.of(context).primaryColor, Icons.near_me, 'ROUTE'),
                // _buildButtonColumn(
                //     Theme.of(context).primaryColor, Icons.share, 'SHARE'),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(
                    'EN SAVOIR PLUS',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.teal,
                  onPressed: () {
                    Navigator.push(
                        context,
                        //context c'est le contexte qui en haut (material Build contexte)
                        MaterialPageRoute(
                            builder: (context) =>
                                new Departement() //la classe Accueil est importée en haut
                            //builder: (context)=>ListePharmacies() // on peut ne pas utiliser le new
                            //builder: (context)=>{return new ListePharmacies();} // on peut utiliser des accolades avec return new et ajouter d'autres instructions (;)
                            ));
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(
                    'CANDIDATER',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.deepOrange,
                  onPressed: () {
                    //pour changer l'etat d'un élément on utilise setState de la classe State
                    Navigator.push(
                        context,
                        //context c'est le contexte qui en haut (material Build contexte)
                        MaterialPageRoute(
                            builder: (context) =>
                                new Candidature() //la classe Accueil est importée en haut
                            //builder: (context)=>ListePharmacies() // on peut ne pas utiliser le new
                            //builder: (context)=>{return new ListePharmacies();} // on peut utiliser des accolades avec return new et ajouter d'autres instructions (;)
                            ));
                  },
                ),
              ],
            ),
          ),
          textSection,
        ],
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
                  Divider(
                    color: Colors.teal,
                  ),
                  //pour créer une ligne de séparation
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
