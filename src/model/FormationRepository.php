<?php

namespace src\model;

use libs\system\Model;

class FormationRepository extends Model{

    /**
     * Methods with DQL (Doctrine Query Language)
     */
    public function __construct(){
        parent::__construct();
    }

    //Recupéreration de toutes les formations
    public function getAllFormation()
    {
        $formations = $this->db->getRepository('Formation')->findAll();
        return $formations;
    }

    //Recupéreration d'une formation
    public function getOneFormation($id)
    {
        $formation =  $this->db->getRepository('Formation')->findBy(['id'=>$id]);
        return $formation;
    }




}