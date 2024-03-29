<?php
   class NoticeManager
    {
        private $_db; // Instance de PDO
        
		// recupere une instance de PDO pour construire l'objet voulue
        public function __construct($db) {
            $this->setDb($db);
        }
        
        public function add(Notice $notice) {
            $query = $this->_db->prepare('INSERT INTO notices SET
				source = :source,
				title = :title, 
				date_post = :date_post, 
				message = :message, 
				registered_notice = :registered_notice;');
			
			$query->bindValue(':source', $notice->source(), PDO::PARAM_STR);
			$query->bindValue(':title', $notice->title(), PDO::PARAM_STR);
			$query->bindValue(':date_post', $notice->date_post(), PDO::PARAM_STR);
			$query->bindValue(':message', $notice->message(), PDO::PARAM_STR);
			$query->bindValue(':registered_notice', $notice->registered_notice(), PDO::PARAM_STR);

            $query->execute();
        }
        
        public function count() {
            return $this->_db->query('SELECT COUNT(*) FROM notices')->fetchColumn();
        }
        
        public function delete(Notice $notice) {
            $this->_db->exec('DELETE FROM notices WHERE id = '.$notice->id_notice());
        }
        
		// test si un registered existe dans la DB par rapport a son id ou son emai ou son pseudo
        public function exists($info) {
            if (is_int($info)) {
                return (bool) $this->_db->query('SELECT COUNT(*) FROM notices WHERE registered_notice = '.$info)->fetchColumn();
            }
			
            $query = $this->_db->prepare('SELECT COUNT(*) FROM notices WHERE source = :source');
			$query->bindValue(':source', $info, PDO::PARAM_STR);
            $query->execute();
            
            return (bool) $query->fetchColumn();
        }
        
		// renvoie une instance de registered par rapport a un id
        public function get($info) {
            if (is_int($info)) {
                $query = $this->_db->query('SELECT
					source = :source,
					title = :title, 
					date_post = :date_post, 
					message = :message, 
					registered_notice = :registered_notice
					FROM registereds 
					WHERE id_registered = '.$info);
                $donnees = $query->fetch(PDO::FETCH_ASSOC);
                
                return new Registered($donnees);
            }
        }
        
		//inutile pour le moment car elle n'est pas adapt� aux cas d'utilisation actuel
        public function getList($name) {
            $register = array();
            
            $query = $this->_db->prepare('SELECT pseudo, 
				avatar, 
				name, 
				firstname, 
				email, 
				birth_date, 
				password, 
				last_connection, 
				grant,
				family_registered 
				FROM registereds 
				ORDER BY name');
            $query->execute();
            
            while ($donnees = $query->fetch(PDO::FETCH_ASSOC))
            {
                $register[] = new Registered($donnees);
            }
            
            return $register;
        }
        
        public function update(Registered $register) {
            $query = $this->_db->prepare('UPDATE registereds SET
				pseudo = :pseudo, 
				avatar = :avatar, 
				name = :name, 
				firstname = :firstname, 
				email = :email, 
				birth_date = :birth_date, 
				password = :password, 
				last_connection = :last_connection, 
				grant = :grant,
				family_registered = :family_registered
				WHERE id_registered = :id_registered');
            
			$query->bindValue(':id_registered', $register->id_registered(), PDO::PARAM_INT);
			$query->bindValue(':pseudo', $register->pseudo(), PDO::PARAM_STR);
			$query->bindValue(':avatar', $register->avatar(), PDO::PARAM_LOB);
			$query->bindValue(':name', $register->name(), PDO::PARAM_STR);
			$query->bindValue(':firstname', $register->firstname(), PDO::PARAM_STR);
			$query->bindValue(':email', $register->email(), PDO::PARAM_STR);
			$query->bindValue(':birth_date', $register->birth_date(), PDO::PARAM_STR);
			$query->bindValue(':password', $register->password(), PDO::PARAM_STR);
			$query->bindValue(':last_connection', $register->last_connection(), PDO::PARAM_STR);
			$query->bindValue(':grant', $register->grant(), PDO::PARAM_INT);
			$query->bindValue(':family_registered', $register->family_registered(), PDO::PARAM_INT);
			
            $query->execute();
        }
		
		public function connectRegister($login='',$password=''){

			try{
				
				//preparation et execution de la requete SQL
				$req = $this->_db->prepare('SELECT * FROM registereds
										WHERE (pseudo = :pseudo OR email = :email) AND password = :password');
										
				$req->bindValue(':pseudo', $login, PDO::PARAM_STR);
				$req->bindValue(':password', hash('sha256',$password), PDO::PARAM_STR);
				$req->bindValue(':email', $login, PDO::PARAM_STR);
				
				$req->execute();
				
				//entrer des donn�es re�ues dans un tableau
				$data = $req->fetch(PDO::FETCH_ASSOC);
				if(is_array($data)) {
					return new Registered($data);
				}
				else {
					return new Registered(array());
				}
				
			}
			catch(Exception $e) {
				// En cas d'erreur pr�c�demment, on affiche un message et on arr�te tout
				die('Erreur : '.$e->getMessage());
			}
		}
        
        public function setDb(PDO $db) {
            $this->_db = $db;
        }
    }