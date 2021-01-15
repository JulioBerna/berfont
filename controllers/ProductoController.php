<?php 

class productoController{
    public function index() {
        // echo "Controlador Productos-Servicios, Acción index"; 
        // Renderizar vista
        require_once 'views/producto/destacados.php';
    }
}

?>