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



}