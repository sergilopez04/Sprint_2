<?php
require_once "TipoVehiculo.php";
require_once "Vehiculo.php";
require_once "Concesionaria.php";

$vehiculo1 = new Vehiculo("Toyota Corolla", 30, TipoVehiculo::sedan);
$vehiculo2 = new Vehiculo("Ford Explorer", 40, TipoVehiculo::suv);
$vehiculo3 = new Vehiculo("Volvo Truck", 50, TipoVehiculo::camion);

$concesionaria = new Concesionaria("Autos del Mundo", [$vehiculo1, $vehiculo2, $vehiculo3]);

echo "Buscar vehículos tipo SUV:" . PHP_EOL;
$concesionaria->buscarVehiculoTipo("SUV");

echo PHP_EOL . "Vehículo que tarda más en fabricarse:" . PHP_EOL;
$concesionaria->buscarQueSeFabricaMasTarde();
?>