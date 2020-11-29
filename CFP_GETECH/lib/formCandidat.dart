import 'package:CFP_GETECH/main.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/services.dart';
import 'dart:convert'; //pour convertir au format json
import 'package:http/http.dart' as http;
import 'dart:async';

// Define a custom Form widget.
class Candidature extends StatefulWidget {
  @override
  _CandidatureState createState() => _CandidatureState();
}
// Future<CandidatModel> addCandidat(String nom, String prenom, String adresse, String telephone,
//     String email, String sexe/*, String formation, String profil*/) async{
//   final String apiUrl = "http://192.168.1.16:1105/Candidat/addCandidat";
//
//   final reponse = await http.post(apiUrl, body: {
//     "nom": nom,
//     "prenom": prenom,
//     "adresse": adresse,
//     "telephone": telephone,
//     "email": email,
//     "sexe": sexe,
//     // "id_formation": 9,
//     // "id_profil": 3
//   });
//
//   if(reponse.statusCode == 201){
//     final String reponseString = reponse.body;
//
//     return candidatModelFromJson(reponseString);
//   }else{
//     return null;
//   }
// }

class _CandidatureState extends State<Candidature> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

//déclaration de candiadt comme variable globale
  //CandidatModel _candidat;

  //==============
  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  //déclaration attributs de control des champs de saisis
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController sexeController = TextEditingController();

  final TextEditingController formationController = TextEditingController();
  final TextEditingController profilController = TextEditingController();

  //====================
  Future addCandidat() async {
    // affichage bar de progression circulaire CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    //=========================
    String nom = nomController.text;
    String prenom = prenomController.text;
    String adresse = adressController.text;
    String telephone = telephoneController.text;
    String email = emailController.text;
    String sexe = sexeController.text;
    String formation = formationController.text;
    String profil = profilController.text;

    // recupération des données dans la variable donnees.
    var donnees = {
      "nom": nom,
      "prenom": prenom,
      "adresse": adresse,
      "telephone": telephone,
      "email": email,
      "sexe": sexe,
      "formation": formation,
      "profil": profil
    };
    final String apiUrl = "http://192.168.1.16:1105/Candidat/addCandidat";
    // Starting Web API Call.
    var response = await http.post(apiUrl, body: json.encode(donnees));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 201) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: new Text(message),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: new Text("OK"),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: Text('Candidature'),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    //padding: const EdgeInsets.all(12.0),
                    Text('Formulaire de candidature',
                        style: TextStyle(fontSize: 21)),
                    Divider(
                      color: Colors.teal,
                      thickness: 2,
                    ),
                    // Ajout des champs de saisis
                    TextFormField(
                      controller: nomController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Votre Nom',
                        icon: const Icon(Icons.person),
                      ),
                      // validation de la valeur donnée par user
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veillez renseigner ce champ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: prenomController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Votre Prénom',
                        icon: const Icon(Icons.person),
                      ),
                      // validation de la valeur donnée par user
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veillez renseigner ce champ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: adressController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Adresse',
                        icon: const Icon(Icons.place),
                      ),
                      // validation de la valeur donnée par user
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veillez renseigner ce champ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: telephoneController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Téléphone',
                        icon: const Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      // validation de la valeur donnée par user
                      validator: (value) {
                        if (value.isEmpty || value.length < 9) {
                          return 'Veillez renseigner ce champ correctement';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Email',
                        icon: const Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      // validation de la valeur donnée par user
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veillez renseigner ce champ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: sexeController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Sexe',
                        icon: const Icon(Icons.group),
                      ),
                      // validation de la valeur donnée par user
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veillez renseigner ce champ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: formationController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Formation',
                        icon: const Icon(Icons.auto_stories),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veillez renseigner ce champ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: profilController,
                      decoration: InputDecoration(
                        //hintText: 'Votre Nom',
                        labelText: 'Profil',
                        icon: const Icon(Icons.badge),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veillez renseigner ce champ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    // _candidat == null ? Container():
                    //     Text("Bonjour ${_candidat.prenom}, votre candidature a été bien enregistrée"),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            // onPressed: () async {
                            //   // Validate returns true if the form is valid, otherwise false.
                            //   // if (_formKey.currentState.validate()) {
                            //   //   // If the form is valid, display a snackbar. In the real world,
                            //   //   // you'd often call a server or save the information in a database.
                            //   //   Scaffold.of(context).showSnackBar(
                            //   //       SnackBar(content: Text('Processing Data')));
                            //   // };
                            //},
                            onPressed: addCandidat,
                            color: Colors.teal,
                            child: Text(
                              'Valider',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            // ),],),
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text(
                              'Annuler',
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            color: Colors.redAccent,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  //context c'est le contexte qui en haut (material Build contexte)
                                  MaterialPageRoute(
                                      builder: (context) => new MyApp() //la classe Accueil est importée en haut
                                    //builder: (context)=>ListePharmacies() // on peut ne pas utiliser le new
                                    //builder: (context)=>{return new ListePharmacies();} // on peut utiliser des accolades avec return new et ajouter d'autres instructions (;)
                                  ));
                            },
                          ),
                          // Visibility(
                          //     visible: visible,
                          //     child: Container(
                          //         margin: EdgeInsets.only(bottom: 30),
                          //         child: CircularProgressIndicator())),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          )
        ])
    );
  }
}
