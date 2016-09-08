<?php

$loops = (isset($_GET['loops']))?$_GET['loops']:100;
$size = (isset($_GET['size']))?$_GET['size']:1000;


for ($test=0; $test < $loops; $test++) {
    $max = $size;
    $done = false;
    while(!$done){
        $numbers = range(0, $max);
        shuffle($numbers);
        $done = true;
        foreach($numbers as $key => $val){
            if($key == $val){
                $done = false;
                break;
            }
        }
    }
}

var_dump($numbers);
