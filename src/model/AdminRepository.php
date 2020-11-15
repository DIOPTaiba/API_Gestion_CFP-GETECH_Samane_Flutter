<?php

namespace src\model;

use libs\system\Model;

class AdminRepository extends Model{

    /**
     * Methods with DQL (Doctrine Query Language)
     */
    public function __construct(){
        parent::__construct();
    }

    public function verifieAdminExiste($login_responsable, $mot_passe_responsable)
    {
        return $this->db->getRepository('Admin')->findBy(
            array('email' => $login_responsable, 'motPasse'  => $mot_passe_responsable));
    }

}