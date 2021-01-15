<?php 

class Usuario{
    private $id;
    private $nombre;
    private $apellidos;
    private $direccion;
    private $localidad;
    private $email;
    private $password;
    private $rol;
    // Conexión a la BD
    private $db; 

    public function__construct() {
        $this->db = Database::connect();
    }

    // getters
    function getId() {
        return $this->id;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getApellidos() {
        return $this->apellidos;
    }

    function getDireccion() {
        return $this->direccion;
    }

    function getLocalidad() {
        return $this->localidad;
    }

    function getEmail() {
        return $this->email;
    }

    function getPassword() {
        return $this->password;
    }

    function getRol() {
        return $this->rol;
    }

    //setters
    function setId($id) {
        $this->id = $id;
    }

    function setNombre($nombre) {
        $this->nombre = $this->db->real_escape_string ($nombre);
    }

    function setApellidos($apellidos) {
        $this->apellidos = $this->db->real_escape_string ($apellidos);
    }

    function setDireccion($direccion) {
        $this->direccion = $direccion;
    }

    function setLocalidad($localidad) {
        $this->localidad = $localidad;
    }

    function setEmail($email) {
        $this->email = $this->db->real_escape_string ($email);
    }

    function setPassword($password) {
        $this->password = password_hash($this->db->real_escape_string($password), PASSWORD_BCRYPT, ['cost' => 4]);
    }

    function setRol($rol) {
        $this->rol = $rol;
    }


    public function save() {
        $sql = "INSERT INTO usuarios VALUES (NULL, 
                                            '{$this->getNombre()}',                        
                                            '{$this->getApellidos()}',
                                            '{$this->getDireccion()}',
                                            '{$this->getLocalidad()}',
                                            '{$this->getEmail()}',
                                            '{$this->getPassword()}',
                                            'user',
                                             )";
        $save = $this->db->query($sql);

        $result = false;
        if($save) {
            $result = true;
        }
        return $result;
    }

    public function login() {
        $result = false;
        $email = $this->email;
        $password = $this->password;

        // Comprobamos si existe el usuario
        $sql = "SELECT * FROM usuarios WHERE email = '$email' ";
        $login = $this->db->query($sql);

        if($login && $login->num_rows == 1) {
            $usuario = $login->fetch_object();

            // Verificamos contraseña
            $verify = password_verify($password, $usuario->password);

            if($verify) {
                $result = $usuario;
            }
        }

        return $result;
    }


}

 

