<?php
session_start();
require_once '../conexion/conexion.php';
if(empty($_POST['usuario']) && empty($_POST['password'])){
  echo '<div class="msj">Algunos datos están vacios</div>';
}else{
  $sql = 'SELECT * FROM users WHERE usuario = "'.$_POST['usuario'].'"';
  $query = $db->prepare($sql);
  $query->execute();
  $result = $query->fetch(PDO::FETCH_ASSOC);
    // var_dump($result);
    //$hash = password_hash(1234, PASSWORD_DEFAULT);
    //echo $hash;
   if(count($result) > 0 && password_verify($_POST['password'], $result['password'])){
     $_SESSION['usuario'] = $result['usuario'];
     //header('Location: ../home.php');
     echo 'ok';
   }else{
     echo '<div class="msj">Usuario o contraseña incorrecta</div>';
   }
}
