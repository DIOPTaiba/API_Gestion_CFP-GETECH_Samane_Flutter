import 'package:flutter/material.dart';
import 'package:http/http.dart';
//pour créer une page Programmes
class Programme extends StatefulWidget {
  dynamic formation;
  Programme(this.formation);
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.formation['Nom']}'),),
      body: Center(
        child: Text('Liste des Programmes'),
      ),
    );
  }
}
