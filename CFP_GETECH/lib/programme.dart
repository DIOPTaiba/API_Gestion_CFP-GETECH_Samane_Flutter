import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //pour convertir le format json
//pour créer une page Programmes
class Programme extends StatefulWidget {
  dynamic programmes;
  Programme(this.programmes);
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  List<dynamic> listeProgrammes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.programmes['Nom']}'),),
      body: Container(
        child: Center(
          //Si la liste n'est pas encore chargée on affiche 1 cercle de progression
          // si chargée on affiche la liste
            child: this.listeProgrammes == null?CircularProgressIndicator():
            ListView.builder(
              itemCount: this.listeProgrammes == null?0:this.listeProgrammes.length,
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
                          this.listeProgrammes[index]['Nom'],
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>new Programme(listeProgrammes[index])
                              )
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
        ),
      ),
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
    String url = "http://192.168.1.16:1105/Formation/programmes/${widget.programmes['Id']}";
    http.get(url).then((response) {
      setState(() {
        this.listeProgrammes = json.decode(response.body)["Programmes"];
      });
    }).catchError((error) {
      print(error);
    });
  }
}
