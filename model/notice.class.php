 <?php 
 class Notice
 {
        private $_id_notice;
        private $_source;
        private $_title;
        private $_date_post;
        private $_message;
        private $_registered_notice;
		
		public function __construct(array $arr_data) {
            $this->hydrate($arr_data);
        }
        
        // Un tableau de données doit être passé à la fonction (d'où le préfixe « array »)
        public function hydrate(array $arr_data) {
			foreach ($arr_data as $key => $value) {
				// On récupère le nom du setter correspondant à l'attribut
				$method = 'set'.ucfirst($key);
				
				// Si le setter correspondant existe
				if (method_exists($this, $method)) {
					// On appelle le setter
					$this->$method($value);
				}
			}
        }
        
		
		// Ensemble des getters
        public function id_notice() { return $this->_id_notice; }
        public function source() { return $this->_source; }
        public function title() { return $this->_title; }
        public function date_post() { return $this->_date_post; }
        public function message() { return $this->_message; }
        public function registered_notice() { return $this->_registered_notice; }
		
		
		// Verifie si l'instance est valide
		public function isValid() {
			return !(empty($this->_source) || empty($this->_title) || empty($this->_date_post) || empty($this->_message) || empty($this->_registered_notice)));
		}
        
        public function setId_notice($id_notice) {
            $this->_id_notice = (int) $id_notice;
        }
        
        public function setSource($source) {
            if (is_string($source) && preg_match('#^[a-zA-Z]{3,60}$#',$source)) {
                $this->_source = $source;
            }
			else {
			}
        }
        
        public function setTitle($title) {
            
            if (is_string($title) && preg_match('#^[a-zA-Z]{3,60}$#',$title)) {
                $this->_title = $title;
            }
			else {
			}
        }
        
        public function setDate_post($date_post) {
            
			if (is_string($date_post) && preg_match('#(\d{2}|\d{4})(?:\-)?([0]{1}\d{1}|[1]{1}[0-2]{1})(?:\-)?([0-2]{1}\d{1}|[3]{1}[0-1]{1})(?:\s)?([0-1]{1}\d{1}|[2]{1}[0-3]{1})(?::)?([0-5]{1}\d{1})(?::)?([0-5]{1}\d{1})#',$date_post)) {
                $this->_date_post = $date_post;
            }
			else {
			}
        }
        
        public function setMessage($message) {
            
			if (is_string($message) && preg_match('#^[a-zA-Z]{3,255}$#',$message)) {
                $this->_message = $message;
            }
			else {
			}
        }
        
        public function setRegistered_notice($email) {
                $this->_registered_notice = (int) $registered_notice;
        }
    }
