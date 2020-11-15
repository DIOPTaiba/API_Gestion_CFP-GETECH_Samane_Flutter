<?php

use libs\system\Controller;
use src\model\ResponsableRepository;
class ResponsableController extends Controller
{
    public function __construct()
    {
        parent::__construct();        
    }

    public function verifieResponsable()
    {
        extract($_POST);
        $responsable = new ResponsableRepository();
        $resultat = $responsable->verifieResponsableExiste($login_responsable, $mot_passe_responsable);
        if ($resultat)
        {
            return $this->view->load("responsable/accueil_responsable");
        }
        else
        {
            $data['error'] = "erreur";
            return $this->view->load("welcome/index", $data);
        }
    }
    

}




?>