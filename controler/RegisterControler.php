<?php

if(!empty($MyPost['submit'])) {

	if($MyPost['password'] === $MyPost['confirmPassword']) {
		if($MyPost['email'] === $MyPost['confirmEmail']) {
		
			//concatenation pour respecter le format de la date
			$MyPost['birth_date']=$MyPost['year'].'-'.$MyPost['month'].'-'.$MyPost['day'];
			
			$register = new Registered($MyPost);
			
			// si aucun des champs obligatoire est vide
			if($register->isValid()) {
			
				$manager = new RegisteredManager($db->getMysqlConnexion());
				
				if ($manager->exists($register->pseudo())) {
					echo 'Ce pseudo est déjà pris.';
					unset($register); // suppression de l'objet
					include_once('../view/formRegister.view.php');
				}
				elseif ($manager->exists($register->email())) {
					echo 'Ce email est déjà utilisé.';
					unset($register); // suppression de l'objet
					include_once('../view/formRegister.view.php');
				}
				else
				{
					// ajout dans la base de donnee
					$manager->add($register);
					$_SESSION['register']=$register;

					if($register->ageRegistered()<18) {
						include_once('../view/checkMin.view.php');
					}
					else {
						$register->sendConfirmMail();
						include_once('../view/checkMaj.view.php');
					}
				}
			}
			else {
				unset($register); // suppression de l'objet
				echo 'Des champs sont invalides.';
				include_once('../view/formRegister.view.php');
			}
		}
		else {
			echo 'les deux e-mail ne correspondent pas';
			unset($register); // suppression de l'objet
			include_once('../view/formRegister.view.php');
		}
	}
	else {
		echo 'Les mots de passe rentrés ne correspondent pas !';
		include_once('../view/formRegister.view.php');
	}
}
else {
	include_once('../view/formRegister.view.php');
}