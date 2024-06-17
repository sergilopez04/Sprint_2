<?php
enum TipoVehiculo: string {
    case sedan = "Sedán";
    case suv = "SUV";
    case camion = "Camión";

    public function getTipoVehiculo(): string {
        return match ($this) {
            self::sedan => "Sedán",
            self::suv => "SUV",
            self::camion => "Camión"
        };
    }
}
?>