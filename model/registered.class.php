 <?php 
 class Registered
 {
        private $_id_registered;
        private $_pseudo;
        private $_avatar;
        private $_name;
        private $_firstname;
        private $_email;
		private $_birth_date;
		private $_password;
		private $_last_connection;
		private $_grant;
		private $_family_registered;
		
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
        public function id_registered() { return $this->_id_registered; }
        public function pseudo() { return $this->_pseudo; }
        public function avatar() { return $this->_avatar; }
        public function name() { return $this->_name; }
        public function firstname() { return $this->_firstname; }
        public function email() { return $this->_email; }
		public function birth_date() { return $this->_birth_date; }
		public function password() { return $this->_password; }
		public function last_connection() { return $this->_last_connection; }
		public function grant() { return $this->_grant; }
		public function family_registered() { return $this->_family_registered; }
		
		
		// Verifie si l'instance est valide
		public function isValid() {
			return !(empty($this->_pseudo) || empty($this->_name) || empty($this->_firstname) || empty($this->_email) || empty($this->_birth_date) || empty($this->_password));
		}
		
		
		// Calcule l'age par rapport a une entrée de date au format sql
		public function ageRegistered() {
		  list($year, $month, $day) = explode('-', $this->_birth_date);
		  $today['month'] = date('n');
		  $today['day'] = date('j');
		  $today['year'] = date('Y');
		  $years = $today['year'] - $year;
		  if ($today['month'] <= $month) {
			if ($month == $today['month']) {
			  if ($day > $today['day'])
				$years--;
			  }
			else
			  $years--;
			}
		  return (int) $years;
		}
        
        public function setId_registered($id_registered) {
            $this->_id_registered = (int) $id_registered;
        }
        
        public function setPseudo($pseudo) {
            if (is_string($pseudo) && preg_match('#^[a-zA-Z]{1}[a-zA-Z0-9\-_\.]{3,19}$|^[a-zA-Z0-9\-_\.]{3,19}[a-zA-Z]{1}$#',$pseudo)) {
                $this->_pseudo = $pseudo;
            }
			else {
			}
        }
        
        public function setAvatar($avatar) {
            
            if ($avatar) {
                $this->_avatar = $avatar;
            }
			else {
			}
        }
        
        public function setName($name) {
            
			if (is_string($name) && preg_match('#^[a-zA-Z]{3,50}$#',$name)) {
                $this->_name = $name;
            }
			else {
			}
        }
        
        public function setFirstname($firstname) {
            
			if (is_string($firstname) && preg_match('#^[a-zA-Z]{3,50}$#',$firstname)) {
                $this->_firstname = $firstname;
            }
			else {
			}
        }
        
        public function setEmail($email) {
            
			if (is_string($email) && preg_match('#^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$#',$email)) {
                $this->_email = $email;
            }
			else {
			}
        }
		
		public function setBirth_date($birth_date) {
            
			if (is_string($birth_date) && preg_match('#([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})#',$birth_date)) { 
				$this->_birth_date = $birth_date;
            }
			else {
			}
        }
		
		public function setPassword($password) {
            
			if (is_string($password) && strlen($password) <= 255 && strlen($password) >= 6) { // test pour mot de passe
                $this->_password = hash( "sha256" ,$password);
            }
			else {
			}
        }
		
		public function setLast_connection($last_connection) {
            
			if (is_string($last_connection) && preg_match('#^(19[0-9]{2}|[2-9][0-9]{3})-((0(1|3|5|7|8)|10|12)-(0[1-9]|1[0-9]|2[0-9]|3[0-1])|(0(4|6|9)|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(02)-(0[1-9]|1[0-9]|2[0-9]))\x20(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}$#',$last_connection)) {
                $this->_last_connection = $last_connection;
            }
			else {
			}
        }
		
		public function setGrant($grant) {
            $grant = (int) $grant;
            
			if ($grant >= 0 && $grant <=3) {
                $this->_grant = $grant;
			}
        }
		
		public function setFamily_registered($family_registered) {
		
            $this->_family_registered = (int) $family_registered;
        }
		
		public function sendMail() {

			$to = $this->_email;
			$subject = 'Oubli du mot de passe de Family Life';
			$message = 'Vous avez oublié votre mot de passe pour vous connecter sur le site de Family Life ? <br/>
			Ne vous inquiétez pas ! Cliquez sur ce lien pour entrer un nouveau mot de passe.  <br/>
			<a href="MainControler.php?action=send_Mail&valid='.$this->_id_registered.'.'.$this->_password.'">
			MainControler.php?action=send_Mail&valid='.$this->_id_registered.'.'.$this->_password.'</a>'; // il y aura une couille en production
			
			$headers = 'From:noreply@family-life.com'."\r\n";
			$headers.='MIME-version: 1.0'."\r\n";
			$headers.='Content-type: text/html; charset=utf-8'."\r\n";
			
			mail($to,$subject,$message,$headers);
    
		}
		
		public function sendConfirmMail() {

			$to = $this->_email;
			$subject = 'Validation de l\'inscription à Family Life';
			$message = 'Merci pour vous être inscrit sur Family Life ! <br/>
			Vous pourrez vous connecter sur le site après avoir cliqué sur le lien d\'activation ci-dessous : <br/>
			<a href="MainControler.php?action=send_Mail&valid='.$this->_id_registered.'.'.$this->_password.'"> 
			MainControler.php?action=send_Mail&valid='.$this->_id_registered.'.'.$this->_password.'</a>'; // il y aura une couille en production
			
			$headers = 'From:noreply@family-life.com'."\r\n";
			$headers.='MIME-version: 1.0'."\r\n";
			$headers.='Content-type: text/html; charset=utf-8'."\r\n";
			
			mail($to,$subject,$message,$headers);
    
		}

    }
