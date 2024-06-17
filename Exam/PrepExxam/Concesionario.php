<?php
require_once "Vehiculo.php";
require_once "TipoVehiculo.php";

class Concesionaria {
    public string $nombreTienda;
    public array $inventario;

    public function __construct(string $nombreTienda, array $inventario){
        $this->nombreTienda = $nombreTienda;
        $this->inventario = $inventario;
    }

    public function agregarVehiculo(Vehiculo $vehiculo){
        $this->inventario[] = $vehiculo;
    }

    public function buscarVehiculoTipo(string $tipoBuscado){
        foreach ($this->inventario as $vehiculo) {
            if ($vehiculo->tipo->getTipoVehiculo() === $tipoBuscado) {
                echo $vehiculo->__toString();
            }
        }
    }

    public function buscarQueSeFabricaMasTarde(): void {
        $maxDias = 0;
        $vehiculoFabricacionTardia = null;
        foreach ($this->inventario as $vehiculo) {
            if($vehiculo->diasFabricacion > $maxDias){
                $maxDias = $vehiculo->diasFabricacion;
                $vehiculoFabricacionTardia = $vehiculo;
            }
        }
        if ($vehiculoFabricacionTardia) {
            echo "El vehículo que tarda más en fabricarse es: " . PHP_EOL . $vehiculoFabricacionTardia->__toString();
        }
    }
}
?>