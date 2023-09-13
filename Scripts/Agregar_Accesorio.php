<?php
require_once '../Clases/Accesorios.php';
$conexion = new Conexion();
$name = $_POST['name'];
$information = $_POST['information'];
$price = $_POST['price'];
$stock = $_POST['stock'];
$accesorios = new Accesorios(0,$name,$information,$price,$stock);
$resultado = $accesorios->AgregarAccesorio();
if($resultado > 0) {
    echo "Accesorio agregado correctamente.";
} else {
    echo "Error al agregar el accesorio.";
}

?>