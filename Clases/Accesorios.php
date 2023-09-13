<?php
require_once 'conexion.php';

class Accesorios {
    private $conexion;
    private $name;
    private $information;
    private $price;
    private $stock; 

    public function getname() {
        return $this->name;
    }

    public function setPropietario($name) {
        $this->name = $name;
    }

    public function getinformation() {
        return $this->information;
    }

    public function setinformation($information) {
        $this->information = $information;
    }

    public function getprice() {
        return $this->price;
    }

    public function setprice($price) {
        $this->price = $price;
    }

    public function getstock() { 
        return $this->stock;
    }

    public function setstock($stock) { 
        $this->stock = $stock;
    }

    public function __construct($conexion, $name, $information, $price, $stock) {
        $this->conexion = $conexion;
        $this->name = $name;
        $this->information = $information;
        $this->price = $price;
        $this->stock = $stock;
    }

    public function AgregarAccesorio() {
        $name = mysqli_real_escape_string($this->conexion, $this->name);
        $information = mysqli_real_escape_string($this->conexion, $this->information);
        $price = floatval($this->price);
        $stock = intval($this->stock);
        
        $query = "INSERT INTO accessories (name, information, price, stock, created_at) VALUES ('$name', $information, $price, $stock, NOW())";
        $resultado = mysqli_query($this->conexion, $query);
        
        
        if ($resultado > 0) {
            echo "Accesorio creado exitosamente.";
        } else {
            echo "Error al crear el accesorio: " . mysqli_error($this->conexion);
        }
        
    }


    public function verAccesorios() {
        
        $query = "SELECT * FROM accessories";
        $resultado = mysqli_query($this->conexion, $query);

        if ($resultado > 0 ) {
            echo '<table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Propietario</th>
                        <th>information</th>
                        <th>Información</th>
                        <th>stock</th> <!-- Agregado encabezado para stock -->
                      </tr>
                    </thead>
                    <tbody>';
            while ($fila = mysqli_fetch_assoc($resultado)) {
                echo '<tr>
                        <td>' . $fila['id'] . '</td>
                        <td>' . $fila['name'] . '</td>
                        <td>' . $fila['information'] . '</td>
                        <td>' . $fila['price'] . '</td>
                        <td>' . $fila['stock'] . '</td> <!-- Agregada columna para stock -->
                      </tr>';
            }
            echo '</tbody>
                  </table>';
        } else {
            echo "Error al obtener los accesorios: " . mysqli_error($this->conexion);
        }
    }
   

    public function editarAccesorio($id, $name, $information, $price, $stock) {
        $query = "UPDATE accessories SET name = '$name', information = $information, price = '$price', stock ='$stock' WHERE id = $id";
    
        $resultado = mysqli_query($this->conexion, $query);
    
        if ($resultado) {
            return true;
        } else {
            return false;
        }
    }


    public function eliminarAccesorio($id) {
        
        $id = mysqli_real_escape_string($this->conexion, $id);
        $query = "DELETE FROM accessories WHERE id = $id";
        $resultado = mysqli_query($this->conexion, $query);

        if ($resultado) {
            echo "Accesorio eliminado exitosamente.";
        } else {
            echo "Error al eliminar el accesorio: " . mysqli_error($this->conexion);
        }
    }
}
?>
