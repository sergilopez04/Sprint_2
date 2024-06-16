<?php
enum tipoFruta: string {
    case citrico = "Cítrico";
    case tropical = "Tropical";
    case baya = "Baya";

    public function getTipoFruta(): string{
        return match ($this){
            self::citrico => "Cítrico",
            self::baya => "Baya",
            self::tropical => "Tropical"
        };
    }
}

?>