<?php
    class PDOFactory
    {
		private $_db;
		
        public function getMysqlConnexion()
        {
            $this->_db = new \PDO('mysql:host=localhost;dbname=family-life', 'root', '');
            $this->_db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            
            return $this->_db;
        }
    }