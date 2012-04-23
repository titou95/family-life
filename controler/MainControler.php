<?php
	include_once('../model/includeAll.func.php');
	includeAll();
	
	$request = new HTTPRequest();
	$response = new HTTPResponse();
	$db = new PDOFactory();
	
//Partie des tests
	$MyGet = $request->checkGet($_GET);
	$MyPost = $request->checkPost($_POST);
	
	/*var_dump($MyGet);
	var_dump($MyPost);*/

//Partie de gestion des views

include_once('../view/header.view.php');

	if($request->sessionExists('login')) {
		if (isset($MyGet['action'])) {
			switch ($MyGet['action']) {
				case "inscription":
					$current_page ="../view/main.view.php"; 
					break;
				default: 
					$current_page ="../view/main.view.php";
			}
		} 
		else {
			$current_page = "../view/main.view.php";
		}
	}
	else {
		if (isset($MyGet['action'])) {
			switch ($MyGet['action']) {
				case "inscription":
					$current_page ="../controler/RegisterControler.php"; 
					break;
				case "connexion":
					$current_page ="../controler/ConnexionControler.php";
					break;
				case "forget_password":
					$current_page = "../controler/Forget_passwordControler.php";
					break;
				case "send_Mail":
					$current_page = "../controler/SendMailControler.php";
					break;
				default: 
					$current_page ="../view/home.view.php";
			}
		} 
		else {
			$current_page = "../view/home.view.php";
		}
	}
		
include_once("$current_page");
		
include_once('../view/footer.view.php');