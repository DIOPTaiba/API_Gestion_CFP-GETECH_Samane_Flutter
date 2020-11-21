<?php

namespace src\model;

use libs\system\Model;

class ProgrammeRepository extends Model{

    /**
     * Methods with DQL (Doctrine Query Language)
     */
    public function __construct(){
        parent::__construct();
    }

    //Recupéreration de tous les Programmes
    public function getAllProgramme()
    {
        $programmes = $this->db->getRepository('Programme')->findAll();
        return $programmes;
    }

    //Recupéreration d'un programme
    public function getOneProgramme($id)
    {
        $programme =  $this->db->find('Programme',$id);
        return $programme;
    }



}