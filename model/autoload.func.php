<?php
    function autoload($class) {
        require '../model/'.$class.'.class.php'; // On inclue la classe correspondante au param�tre pass�
    }
    
     spl_autoload_register ('autoload'); 
