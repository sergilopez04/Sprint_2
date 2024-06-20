<?php

function BuscarErrores(string $expresionEvaluada) {
    $counterR = 0;
    $counterL = 0;
    for ($i = 0; $i < strlen($expresionEvaluada); $i++) {
        if ($expresionEvaluada[$i] === "(") {
            ++$counterL;
        } elseif ($expresionEvaluada[$i] === ")") {
            ++$counterR;
        }
    }

    $retVal = ($counterL === $counterR) ? "L'expressió matemàtica és correcte" . PHP_EOL : "L'expressió és incorrecte" . PHP_EOL;
    return $retVal;
}

// Ejemplos de expresiones
$expresionCorrecta = "(3 * 4) + (7 + 3)";
$expresionIncorrecta = "(3* 5 + (7 *2)";

// Llamadas a la función
echo BuscarErrores($expresionCorrecta);
echo BuscarErrores($expresionIncorrecta);

?>