<?php

namespace src\model;

use libs\system\Model;

class CandidatRepository extends Model{

    /**
     * Methods with DQL (Doctrine Query Language)
     */
    public function __construct(){
        parent::__construct();
    }

    //Recupéreration de tous les Candidats
    public function getAllCandidat()
    {
        $candidats = $this->db->getRepository('Candidat')->findAll();
        return $candidats;
    }

    //Ajoiut d'un candidat
    public function addCandidat($candidat)
    {
        if ($candidat != null){
            $this->db->persist($candidat);
            $this->db->flush();
            return 1;
        }else return 0;

    }

    //Recupéreration formation candidat
    public function getFormation($id)
    {
        $formation =  $this->db->find('Formation',$id);
        return $formation;
    }

    //Recupéreration profil candidat
    public function getProfil($id)
    {
        $profil =  $this->db->find('Profil',$id);
        return $profil;
    }

}