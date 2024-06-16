<?php
require_once "TipoFruta.php";

class Fruta{
    public string $nombre;
    public int $diasMaduracion;
    public TipoFruta $tipo;


    public function __construct(string $nombre, int $diasMaduracion, TipoFruta $tipo)
    {
        $this->nombre = $nombre;
        $this->diasMaduracion = $diasMaduracion;
        $this->tipo = $tipo;
    }

    public function __toString(): string
    {
        $mensaje = "Soy $this->nombre, maduro en $this->diasMaduracion días y pertenezco a " . $this->tipo->getTipoFruta() . PHP_EOL;
        return $mensaje;
    }
}


?>