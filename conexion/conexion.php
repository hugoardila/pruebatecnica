<?php
$dsn = 'mysql:host=localhost;dbname=pruebasinergia';
$user = 'root';
$pass = '';

try{
    $db = new PDO($dsn, $user, $pass);
     //echo 'conectado <br>';
    return $db;
}catch(PDOException $e){
    echo '<p>!Error!: <mark>'.$e->getMessage().'</mark></p>';
    die();
}
