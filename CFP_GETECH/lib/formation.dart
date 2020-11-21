import 'package:flutter/material.dart';
//pour créer une page Départements
class Formation extends StatefulWidget {
  @override
  _FormationState createState() => _FormationState();
}

class _FormationState extends State<Formation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formations'),),
      body: Center(
        child: Text('Liste des Formations'),
      ),
    );
  }
}
