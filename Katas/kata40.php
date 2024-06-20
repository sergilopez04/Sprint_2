<?
$expresionCorrecta = "(3 * 4) + (7 + 3)";
var_dump($expresionCorrecta);
$expresionIncorrecta = "(3* 5 + (7 *2)";

function BuscarErrores(string $expresionEvaluada){
    $counterR = 0;
    $counterL = 0;
    $checker = false;
    for ($i=0; $i < strlen($expresionEvaluada); $i++) { 
        if ($expresionEvaluada[$i] === "("){
            ++$counterL;
        }
        elseif ($expresionEvaluada[$i] === ")"){
            ++$counterR;
        }
    }
}


?>