<?php
	if(!empty($MyPost['submit'])) {
	
		$db = new PDOFactory();
		$manager = new RegisteredManager($db->getMysqlConnexion());
		
		if($manager->exists($MyPost['login'])) {
			$register = $manager->connectRegister($MyPost['login'],$MyPost['password']);
			
			if(!$register->isValid()) {
				unset($db);
				unset($manager);
				include_once('../view/home.view.php');
			}
			else {
				//if($register->grant>0) {
					$_SESSION['login']=true;
					$_SESSION['register']=$register;
					include_once('../view/main.view.php');
				/*}
				else {
					echo 'valider email'; //include la page de demande de validation et proposer de renvoyer un mail
				}*/
			 }
		}
		else {
			include_once('../view/home.view.php');
		}
	}
	else {
		include_once('../view/home.view.php');
	}