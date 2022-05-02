<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Login</title>
  </head>
  <?php require_once 'inc/head.php' ?>
  <body>
        <div class="container-login">

        <form>
          <div class="field">
            <label class="label">Usuario</label>
            <input class="input" name="usuario" type="text" placeholder="Usuario">
          </div>
          <div class="field">
            <label class="label">Contraseña</label>
            <input class="input" name="password" type="password" placeholder="Contraseña">
          </div>
            <button class="button is-primary" type="submit">Ingresar</button>
        </form>
        <div class="respuesta"></div>
      </div>
      <script src="js/main.js"></script>
    </body>
</html>
