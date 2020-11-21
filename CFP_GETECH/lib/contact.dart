import 'package:flutter/material.dart';
//pour créer une page Départements
class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts'),),
      body: Center(
        child: Text('Liste des Contacts'),
      ),
    );
  }
}
