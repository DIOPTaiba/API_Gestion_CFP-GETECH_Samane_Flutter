import 'package:flutter/material.dart';
//On cré un menu réutilisable sur d'autres applications et
// éviter de copier coller des menus
class Menu extends StatelessWidget {
  //Déclaration des attributs à utiliser pour le menu
  String titleMenu;
  Icon iconMenu;
  //On utilise une fonction pour que lorsqu'on clique sur menu elle sera appelé et
  // parcourira la liste des menus et les afficher
  Function gestionMenu;
  //on cré le contructeur pour que lorsqu'on intenscie cette classe on lui
  // transmet les infos
  Menu(this.titleMenu,this.iconMenu,this.gestionMenu);
  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        title: Text(titleMenu, style: TextStyle(fontSize: 20),),
        //pour ajouter une icone home sur le menu
        leading: iconMenu, //pour le mettre avant le text
        //pour ajouter une icone forme arborescence sur le menu
        //leading: Icon(Icons.account_tree),
        //pour ajouter une setting home sur le menu
        //leading: Icon(Icons.settings),
        trailing: Icon(Icons.play_arrow),
        onTap: (){
          // pour fermé le menu au retour
          //Navigator.pop(context);
          // pour afficher une nouvelle page
          //Navigator.push(context), //context c'est le contexte qui en haut (material Build contexte)
              //MaterialPageRoute(
                //builder: (context)=>new Accueil() //la classe Accueil est importée en haut
                  //builder: (context)=>MyApp() // on peut ne pas utiliser le new
                //builder: (context)=>{return new ListePharmacies();} // on peut utiliser des accolades avec return new et ajouter d'autres instructions (;)
              //));
          // pour afficher la page précédente (retour)
          //Navigator.pop(context)
          this.gestionMenu(context);
        },
      );
      
  }
}
