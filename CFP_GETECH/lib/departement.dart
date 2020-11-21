import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //pour convertir le format json
//import 'package:CFP_GETECH/formation.dart';
import './formation.dart';
//pour créer une page Départements
class Departement extends StatefulWidget {
  @override
  _DepartementState createState() => _DepartementState();
}

class _DepartementState extends State<Departement> {
  List<dynamic> listeDepartements;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Départements'),
      ),
      body: Center(
          //Si la liste n'est pas encore chargée on affiche 1 cercle de progression
          // si chargée on affiche la liste
          child: this.listeDepartements == null?CircularProgressIndicator():
              ListView.builder(
                  itemCount: this.listeDepartements == null?0:this.listeDepartements.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.teal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Colors.black26,
                            child: Text(
                              this.listeDepartements[index]['Nom'],
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            onPressed: (){
                              Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context)=>new Formation(listeDepartements[index])
                                )
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    //cette méthode s'exécute au moment de l'exécution du widget
    super.initState();
    //on cré la fonction listeDepartement
    afficheDepartements();
  }

  void afficheDepartements() {
    String url = "http://192.168.1.14:1105/Departement";
    http.get(url).then((response) {
      setState(() {
        this.listeDepartements = json.decode(response.body)["Departements"];
      });
    }).catchError((error) {
      print(error);
    });
  }
}
