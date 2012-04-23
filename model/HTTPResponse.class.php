<?php
    class HTTPResponse
    {
        
        public function addHeader($header) {
            header($header);
        }
        
        public function redirect($location) {
            header('Location: '.$location);
            exit;
        }
        
        public function redirect404() {
			header('HTTP/1.0 404 Not Found'); //a faire une page 404 not found
            exit;
        }
        
        // Changement par rapport à la fonction setcookie() : le dernier argument est par défaut à true
        public function setCookie($name, $value = '', $expire = 0, $path = null, $domain = null, $secure = false, $httpOnly = true) {
            setcookie($name, $value, $expire, $path, $domain, $secure, $httpOnly);
        }
    }
