import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//pour créer une page Départements
class Departement extends StatefulWidget {
  @override
  _DepartementState createState() => _DepartementState();
}

class _DepartementState extends State<Departement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Départements'),),
      body: Center(
        child: Text('Liste des Départements'),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    //cette méthode s'exécute au moment de l'exécution du widget
    super.initState();
    //on cré la fonction listeDepartement
    listeDepartement();
  }
  void listeDepartement(){
    
  }
}
