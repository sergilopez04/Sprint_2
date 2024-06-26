<?php
require_once "Fruta.php";
require_once "TipoFruta.php";

class Fruteria {
    public string $nombreTienda;
    public array $inventario;

    public function __construct(string $nombreTienda, array $inventario){
        $this->nombreTienda = $nombreTienda;
        $this->inventario = $inventario;
    }

    public function agregarFruta(Fruta $fruta){
        $this->inventario[] = $fruta;
    }

    public function buscarFrutaTipo(string $tipoBuscado){
        foreach ($this->inventario as $fruta) {
            if ($fruta->tipo->getTipoFruta() === $tipoBuscado) {
                echo $fruta->__toString();
            }
        }
    }

    public function buscarQueMaduraMasTarde(): void {
        $maxDias = 0;
        $frutaMaduracionTardia = null;
        foreach ($this->inventario as $fruta) {
            if($fruta->diasMaduracion > $maxDias){
                $maxDias = $fruta->diasMaduracion;
                $frutaMaduracionTardia = $fruta;
            }
        }
        if ($frutaMaduracionTardia) {
            echo "La fruta que tarda más en madurar es: " . PHP_EOL . $frutaMaduracionTardia->__toString();
        }
    }

}


?>