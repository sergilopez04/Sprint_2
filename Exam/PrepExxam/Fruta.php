<?php
require_once "tipoFruta.php";

class Fruta{
    public string $nombre;
    public int $diasMaduracion;
    public tipoFruta $tipo;


    public function __construct(string $nombre, int $diasMaduracion, tipoFruta $tipo)
    {
        $this->nombre = $nombre;
        $this->diasMaduracion = $diasMaduracion;
        $this->tipo = $tipo;
    }

    public function __toString(): string
    {
        $mensaje = "Soy $this->nombre, maduro en $this->diasMaduracion días y pertenezo a $this->tipo".PHP_EOL;
        return $mensaje;
    }
}


?>