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
use src\model\FormationRepository;
class FormationController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

//=============================================Recupération de toutes les formations===============================================
    //Recupération tous les formations
    public function index()
    {
        $formations = new FormationRepository();
        $resultat = $formations->getAllFormation();

        if($resultat != null)
        {
            // On initialise un tableau associatif
            //$data = [];
            //$data['departement'] = [];

            foreach($resultat as $formation)
            {
                $formation = [
                    "Id" => $formation->getId(),
                    "Nom" => $formation->getNom(),
                ];

                $data['Formations'][] = $formation;

            }

            // On envoie le code réponse 200 OK
            http_response_code(200);

            // On encode en json et on envoie
            echo json_encode($data);
        }
        else
        {
            $data['Warning'] = "Désolé! aucune formation disponible";
            // On encode en json et on envoie
            echo json_encode($data);
        }
    }

//=============================================Recupération d'une formations===============================================
    //Recupération tous les formations
    public function getOneFormation()
    {
        extract($_POST);
        $formation = new FormationRepository();
        $resultat = $formation->getOneFormation($id);

        if($resultat != null)
        {
            // On initialise un tableau associatif
            //$data = [];
            //$data['departement'] = [];

//            foreach($resultat as $formation)
//            {
                $formation = [
                    "Id" => $resultat->getId(),
                    "Nom" => $resultat->getNom(),
                ];

                $data['Formation'][] = $formation;

            //}
            // On envoie le code réponse 200 OK
            http_response_code(200);

            // On encode en json et on envoie
            echo json_encode($data);
        }
        else
        {
            $data['Warning'] = "Désolé! aucune formation disponible";
            // On encode en json et on envoie
            echo json_encode($data);
        }
    }



}




?>