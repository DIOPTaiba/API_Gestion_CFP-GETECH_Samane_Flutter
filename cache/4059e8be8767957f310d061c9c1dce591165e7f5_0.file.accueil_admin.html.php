<?php
/* Smarty version 3.1.30, created on 2020-11-15 00:25:17
  from "/opt/lampp/htdocs/mesprojets/Application_Gestion_CFP-GETECH/src/view/admin/accueil_admin.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5fb0675d5337e5_55769528',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4059e8be8767957f310d061c9c1dce591165e7f5' => 
    array (
      0 => '/opt/lampp/htdocs/mesprojets/Application_Gestion_CFP-GETECH/src/view/admin/accueil_admin.html',
      1 => 1605395580,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5fb0675d5337e5_55769528 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <title>Ouverture Compte Bancaire</title>
    <meta charset="utf-8" />
    <!-- <link type="text/css" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['url_base']->value;?>
public/css/bootstrap.min.css" /> -->
    <link type="text/css" rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['url_base']->value;?>
public/css/script_index.css" />
</head>

<body>

<header>
    <h1>BIENVENUE DANS LE CENTRE CFP-GETECH</h1>
</header>
<?php if (isset($_smarty_tpl->tpl_vars['insertionOk']->value)) {?>
<div class="alert alert-danger" style="width: 30%; margin: auto; text-align: center;">
    <?php echo $_smarty_tpl->tpl_vars['insertionOk']->value;?>

</div>
<?php }?>
<h2>VEILLEZ CHOISIR LE TYPE DE CLIENT A ENREGISTRER</h2>

<div class="accueil_responsable">

    <a href="<?php echo $_smarty_tpl->tpl_vars['url_base']->value;?>
ClientNonSalarie/compteClientNonSalarie">Compte Client non Salarié</a>

    <a href="<?php echo $_smarty_tpl->tpl_vars['url_base']->value;?>
ClientSalarie/compteClientSalarie">Compte Client Salarié</a>

    <a href="<?php echo $_smarty_tpl->tpl_vars['url_base']->value;?>
ClientMoral/compteClientMoral">Compte Client Moral</a>

</div>

<?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['url_base']->value;?>
public/js/script_index.js"><?php echo '</script'; ?>
>

</body>

</html><?php }
}
