import 'package:CFP_GETECH/programme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //pour convertir le format json
//pour créer une page Départements
class Formation extends StatefulWidget {
  dynamic formations;
  Formation(this.formations);
  @override
  _FormationState createState() => _FormationState();
}

class _FormationState extends State<Formation> {
  List<dynamic> listeFormations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.formations['Nom']}'),),
      body: Center(
        //Si la liste n'est pas encore chargée on affiche 1 cercle de progression
        // si chargée on affiche la liste
          child: this.listeFormations == null?CircularProgressIndicator():
          ListView.builder(
            itemCount: this.listeFormations == null?0:this.listeFormations.length,
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
                        this.listeFormations[index]['Nom'],
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=>new Programme(listeFormations[index])
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
    afficheFormations();
  }
  void afficheFormations() {
    String url = "http://192.168.1.16:1105/Departement/formations/${widget.formations['Id']}";
    http.get(url).then((response) {
      setState(() {
        this.listeFormations = json.decode(response.body)["Formations"];
      });
    }).catchError((error) {
      print(error);
    });
  }
}
