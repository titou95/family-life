<?php
    function autoload($class) {
        require '../model/'.$class.'.class.php'; // On inclue la classe correspondante au paramètre passé
    }
    
     spl_autoload_register ('autoload'); 
