<?php

namespace src\model; 

use libs\system\Model; 
	
class ResponsableRepository extends Model{
	
	/**
	 * Methods with DQL (Doctrine Query Language) 
	 */
	public function __construct(){
		parent::__construct();
    }
    
    public function verifieResponsableExiste($login_responsable, $mot_passe_responsable)
    {
        return $this->db->getRepository('Responsable')->findBy(
            array('email' => $login_responsable, 'motPasse'  => $mot_passe_responsable));
    }
    
}