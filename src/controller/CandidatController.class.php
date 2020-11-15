<?php
//Permet de controler les origines (adresses) autorisées à utiliser l'API
//si on remplace * par www.monsite.com l'API répondra que si la requete vient de ce site
header("Access-Control-Allow-Origin: *");
//Permet de définir le type de contenu de la réponse. les données seront envoyées sous format JSON
header("Content-Type: application/json; charset=UTF-8");
//Permet de définir la méthode autorisée
//header("Access-Control-Allow-Methods: GET");
//Permet de définir la durée de vie de la requete
header("Access-Control-Max-Age: 3600");
//Permet de définir les headers autorisés côté clients
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

use libs\system\Controller;
use src\model\CandidatRepository;
use src\model\ProfilRepository;
use \src\model\FormationRepository;

class CandidatController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

//==========================================Rcupérations des Candidats============================================================

    //Recupération tous les Candidats
    public function getAllCandidat()
    {
        $candidats = new CandidatRepository();
        $resultat = $candidats->getAllCandidat();

        if($resultat != null)
        {
            // On initialise un tableau associatif
            //$data = [];
            //$data['departement'] = [];

            foreach($resultat as $candidat)
            {
                $candidat = [
                    "Id" => $candidat->getId(),
                    "Nom" => $candidat->getNom(),
                    "Prenom" => $candidat->getPrenom(),
                    "Adresse" => $candidat->getAdresse(),
                    "Telephone" => $candidat->getTelephone(),
                    "Email" => $candidat->getEmail(),
                    "Sexe" => $candidat->getSexe(),
                    "Formation" => $candidat->getFormation()->getNom(),
                    "Profil" => $candidat->getProfil()->getNom(),
                ];

                $data['Candidats'][] = $candidat;

            }

            // On envoie le code réponse 200 OK
            http_response_code(200);

            // On encode en json et on envoie
            echo json_encode($data);
        }
        else
        {
            $data['Warning'] = "Désolé! aucun candidat disponible";
            // On encode en json et on envoie
            echo json_encode($data);
        }
    }

//==========================================Ajout de Candidat============================================================

    public function addCandidat()
    {

        //extract($_POST);
        //Recupération des données envoyées
        $donnees = json_decode(file_get_contents("php://input"));
        //var_dump($donnees);die();
     // On vérifie que tous les champs sont renseignés
        if (!empty($donnees->nom) && !empty($donnees->prenom) && !empty($donnees->adresse) && !empty($donnees->telephone)
            && !empty($donnees->email) && !empty($donnees->sexe) && !empty($donnees->formation) && !empty($donnees->profil)){

        //Si tous les champs sont ok on fait le traitement pour ajouter le candidat
            //on recupère le profil sélectionné
            $getProfil = new ProfilRepository();
            $profil = $getProfil->getOneProfil($donnees->profil);
//var_dump($profil);die();
            //on recupère la formation sélectionnée
            $getFormation = new FormationRepository();
            $formation = $getFormation->getOneFormation($donnees->formation);
//var_dump($formation);die();
            $newCandidat = new CandidatRepository();

            $newCandidat->nom = $donnees->nom;
            $newCandidat->prenom = $donnees->prenom;
            $newCandidat->adresse = $donnees->adresse;
            $newCandidat->telephone = $donnees->telephone;
            $newCandidat->email = $donnees->email;
            $newCandidat->sexe = $donnees->sexe;
            $newCandidat->id_formation = $formation;
            $newCandidat->id_profil = $profil;

        //On ajout le client et on vérifie
            if ($newCandidat->addCandidat($newCandidat)){

                //si tout est ok on envoie message ok avec le code 201
                http_response_code(201);
                echo json_encode(["Message" => "Candidature bien enregistrée"]);
            }
            else{
                //s'il y'a erreurs on envoie message avec code 503
                http_response_code(503);
                echo json_encode(["Message" => "L'ajout de la candidature à échoué"]);
            }

        }
        else{
            //s'il y'a des champs non renseignés on envoie message avec code 503
            http_response_code(503);
            echo json_encode(["Message" => "Veillez renseigner tous les champs"]);
        }


    }

}




?>