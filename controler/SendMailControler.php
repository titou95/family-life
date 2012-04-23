<?php
	if(!empty($MyPost['submit'])) {
		if($MyPost['submit'] === 'Connexion') { //traitement pour le renvoie si pas confirmé
		}
		else {
			$register = $_SESSION['register'];
			// si le mail rentrer est le meme que celui de l'utilisateur qui c inscrit
			if($MyPost['email'] == $register->email()) {
				echo 'email fournit est le meme que celui de l\'isncription';
				include_once('../view/checkMin.view.php');
			}
			/* elseif($MyPost['email'] == $register->email()) { //sinon si les parents sont enregistrer envoyer un mail + un message et notif si le site
				
			}
			else { //sinon
				$parent = new Registered($MyPost);
				$parent->sendConfirmMail();
			}*/
		}
		
		include('../view/checkMaj.view.php');
	}
	/* elseif(!empty($MyPost['valid'])) { //traitement du mail cofirmation apres clique sur le lien
		list($id,$password)=explode('.',$MyPost);
		$manager = new RegisteredManager($db->getMysqlConnexion());
		$register = new Registered($manager->get($id));
		if($register->ageRegistered()<18) {
			$register->setGrant(1);
			$manager->update($register);
			include_once(''); // inclure la page de validation
		}
		else {
			$register->setGrant(2);
			$manager->update($register);
			include_once(''); // inclure la page de validation
		}
	} */
	else {
		$current_page = "../view/home.view.php";
	}