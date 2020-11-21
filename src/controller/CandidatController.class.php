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

class CandidatController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

//==========================================Rcupérations des Candidats============================================================

    //Recupération tous les Candidats
    public function index()
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

            $candidatDb = new CandidatRepository();

            //on recupère le profil sélectionné
            $profil = $candidatDb->getProfil($donnees->profil);
            //on recupère la formation sélectionnée
            $formation = $candidatDb->getFormation($donnees->formation);

            $newCandidat = new Candidat();

            $newCandidat->setNom($donnees->nom);
            $newCandidat->setPrenom($donnees->prenom);
            $newCandidat->setAdresse($donnees->adresse);
            $newCandidat->setTelephone($donnees->telephone);
            $newCandidat->setEmail($donnees->email);
            $newCandidat->setSexe($donnees->sexe);
            $newCandidat->setFormation($formation);
            $newCandidat->setProfil($profil);

            $result = $candidatDb->addCandidat($newCandidat);

        //On ajout le client et on vérifie
            if ($result != 0){

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