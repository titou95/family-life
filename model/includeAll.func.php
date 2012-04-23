<?php
	function autoload($class) {
        require '../model/'.$class.'.class.php'; // On inclue la classe correspondante au param�tre pass�
    }
    
     spl_autoload_register ('autoload'); 

	function includeAll() {
		autoload('registered');
		autoload('registeredmanager');
		autoload('PDOFactory');
		autoload('HTTPRequest');
		autoload('HTTPResponse');
		session_start();
	
	}