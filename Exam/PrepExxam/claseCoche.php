<?php
require_once "TipoVehiculo.php";

class Vehiculo {
    public string $nombre;
    public int $diasFabricacion;
    public TipoVehiculo $tipo;

    public function __construct(string $nombre, int $diasFabricacion, TipoVehiculo $tipo) {
        $this->nombre = $nombre;
        $this->diasFabricacion = $diasFabricacion;
        $this->tipo = $tipo;
    }

    public function __toString(): string {
        $mensaje = "Soy $this->nombre, me fabrico en $this->diasFabricacion días y soy un " . $this->tipo->getTipoVehiculo() . PHP_EOL;
        return $mensaje;
    }
}
?>