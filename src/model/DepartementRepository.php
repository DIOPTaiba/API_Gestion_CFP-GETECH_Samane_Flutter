<?php

namespace src\model;

use libs\system\Model;

class DepartementRepository extends Model{

    /**
     * Methods with DQL (Doctrine Query Language)
     */
    public function __construct(){
        parent::__construct();
    }

    //Recupéreration de tous les départements
    public function getAllDepartement()
    {
        $departements = $this->db->getRepository('Departement')->findAll();
        return $departements;
    }

    //Recupéreration d'un département
    public function getOneDepartement($id)
    {
        $departement =  $this->db->find('Departement',$id);
        return $departement;
    }

    //Recupéreration de toutes les formations par département
    public function getFormationByDepartement($id)
    {
        $formations = $this->db->getRepository('Formation')->findBy(['departement'=>$id]);
        return $formations;
    }


}