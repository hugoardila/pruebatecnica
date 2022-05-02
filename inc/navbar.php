<?php
session_start();
if(empty($_SESSION['usuario'])){
  header('Location: index.php');
}
 ?>
<nav class="navbar is-dark" role="navigation" aria-label="main navigation">

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">
      <a class="navbar-item" href="home.php">
        Home
      </a>

      <a class="navbar-item" href="pagina2.php">
        Pagina 2
      </a>

      <a class="navbar-item" href="pagina3.php">
        Pagina 3
      </a>

    </div>

    <div class="navbar-end">
      <a class="navbar-item">
        <?php
        echo $_SESSION['usuario'];
         ?>
      </a>
      <a class="navbar-item" href="login/logout.php">
        Cerrar sesión
      </a>
    </div>
  </div>
</nav>
