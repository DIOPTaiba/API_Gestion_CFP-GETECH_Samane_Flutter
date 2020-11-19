<?php

namespace src\model;

use libs\system\Model;

class ProfilRepository extends Model{

    /**
     * Methods with DQL (Doctrine Query Language)
     */
    public function __construct(){
        parent::__construct();
    }

    //Recupéreration de tous les profils
    public function getAllProfil()
    {
        $profils = $this->db->getRepository('Profil')->findAll();
        return $profils;
    }

    //Recupéreration d'un profil
    public function getOneProfil($id)
    {
        $profil =  $this->db->find('Profil',$id);
        return $profil;
    }


}