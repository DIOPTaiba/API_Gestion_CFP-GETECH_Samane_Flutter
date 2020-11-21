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
use src\model\DepartementRepository;
class DepartementController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }


    //Recupération tous les départements
    public function index()
    {
        $departements = new DepartementRepository();
        $resultat = $departements->getAllDepartement();

        if($resultat != null)
        {
            // On initialise un tableau associatif
            //$data = [];
            //$data['departement'] = [];

            foreach($resultat as $departement)
            {
                $departement = [
                    "Id" => $departement->getId(),
                    "Nom" => $departement->getNom(),
                ];

                $data['Departements'][] = $departement;

            }

            //return $this->view->load("welcome/index", $data);
            //return $this->service->load("departement/getDepartement", $data);
            /* var_dump($data);
            die; */
            // On envoie le code réponse 200 OK
            http_response_code(200);

            // On encode en json et on envoie
            echo json_encode($data);
        }
        else
        {
            $data['Warning'] = "Désolé! aucun departement disponible";
            // On encode en json et on envoie
            echo json_encode($data);
        }
    }

//=============================================Recupération d'un département===============================================

    public function getOneDepartement()
    {
        extract($_POST);
        $departement = new DepartementRepository();
        $resultat = $departement->getOneDepartement($id);

        if($resultat != null)
        {
            // On initialise un tableau associatif
            //$data = [];
            //$data['departement'] = [];

//            foreach($resultat as $departement)
//            {
                $departement = [
                    "Id" => $resultat->getId(),
                    "Nom" => $resultat->getNom(),
                ];

                $data['Departement'][] = $departement;

            //}
            // On envoie le code réponse 200 OK
            http_response_code(200);

            // On encode en json et on envoie
            echo json_encode($data);
        }
        else
        {
            $data['Warning'] = "Désolé! aucun département disponible";
            // On encode en json et on envoie
            echo json_encode($data);
        }
    }

//=========================================Recupération formations d'un département===============================================
    //Recupération tous les départements
    public function formationDepartement($id)
    {
        //extract($_POST);
        $departements = new DepartementRepository();
        $resultat = $departements->getFormationByDepartement($id);

        if($resultat != null)
        {
            // On initialise un tableau associatif
            //$data = [];
            //$data['departement'] = [];

            foreach($resultat as $formation)
            {
                $formations = [
                    "Id" => $formation->getId(),
                    "Nom" => $formation->getNom(),
                ];

                $data['Formations'][] = $formations;

            }

            //return $this->view->load("welcome/index", $data);
            //return $this->service->load("departement/getDepartement", $data);
            /* var_dump($data);
            die; */
            // On envoie le code réponse 200 OK
            http_response_code(200);

            // On encode en json et on envoie
            echo json_encode($data);
        }
        else
        {
            $data['Warning'] = "Désolé! aucune formation disponible pour ce département";
            // On encode en json et on envoie
            echo json_encode($data);
        }
    }


}




?>