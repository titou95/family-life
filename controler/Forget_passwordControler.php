<?php
	// si l'utilisateur accede a cette page par le bouton approprie
	if(!empty($MyPost['submit'])) {
		$manager = new RegisteredManager($db->getMysqlConnexion());
		if($manager->exists($MyPost['email'])) {
			include_once('../view/checkMaj.view.php');
		}
		else {
			echo 'l\'email est invalide';
			include_once('../view/forget_password.view.php');
		}
	}
	else { //sinon il est kick vers la page approprie
		include_once('../view/forget_password.view.php');
	}