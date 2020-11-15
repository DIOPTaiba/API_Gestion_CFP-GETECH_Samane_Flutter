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
        $this->db->persist($candidat);
        $this->db->flush();
    }


}