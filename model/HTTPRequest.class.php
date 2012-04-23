<?php
    class HTTPRequest {
	
		private $_CLEAN;
		
        public function cookieData($key) {
            return isset($_COOKIE[$key]) ? $_COOKIE[$key] : null;
        }
        
        public function cookieExists($key) {
            return isset($_COOKIE[$key]);
        }
		
        public function sessionData($key) {
            return isset($_SESSION[$key]) ? $_SESSION[$key] : null;
        }
        
        public function sessionExists($key) {
            return isset($_SESSION[$key]);
        }
		
        public function getData($key) {
            return isset($_GET[$key]) ? $_GET[$key] : null;
        }
        
        public function getExists($key) {
            return isset($_GET[$key]);
        }
        
        public function postData($key) {
            return isset($_POST[$key]) ? $_POST[$key] : null;
        }
        
        public function postExists($key) {
            return isset($_POST[$key]);
        }
		
		public function checkPost(array $arr_post) {
			foreach($arr_post as $key => $value) {
				$this->_CLEAN["$key"] = htmlspecialchars($value);
			}
			
			return $this->_CLEAN;
		}
		
		public function checkGet(array $arr_get) {
			foreach($arr_get as $key => $value) {
				$this->_CLEAN["$key"] = htmlspecialchars($value);
			}
			
			return $this->_CLEAN;
		}
        
    }
