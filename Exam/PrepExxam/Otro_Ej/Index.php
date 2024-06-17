<?php
require_once "TipoFruta.php";
require_once "Fruta.php";
require_once "Fruteria.php";

$fruta1 = new Fruta("Manzana", 40, TipoFruta::tropical);
$fruta2 = new Fruta("Limón", 70, TipoFruta::citrico);
$fruta3 = new Fruta("Fresa", 14, TipoFruta::baya);
$fruteria = new Fruteria("McDonalds", [$fruta1, $fruta2, $fruta3]);
// $fruteria->inventario = [$fruta1, $fruta2, $fruta3];

echo $fruteria->buscarFrutaTipo("Baya");
echo $fruteria->buscarQueMaduraMasTarde();

?>