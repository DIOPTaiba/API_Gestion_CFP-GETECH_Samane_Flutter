<?php

use libs\system\Controller;
use src\model\AdminRepository;
class AdminController extends Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function verifieAdmin()
    {
        extract($_POST);
        $admin = new AdminRepository();
        $resultat = $admin->verifieAdminExiste($login_admin, $mot_passe_admin);
        if ($resultat)
        {
            return $this->view->load("admin/accueil_admin");
        }
        else
        {
            $data['error'] = "erreur";
            return $this->view->load("welcome/index", $data);
        }
    }


}




?>