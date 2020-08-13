<?php
include './../app/config.php';
include './../app/autoload.php';

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP & MVC</title>
    <link rel="stylesheet" href="<?=URL ?>/public/css/bootstrap.css">
    <link rel="stylesheet" href="<?=URL ?>/public/css/estilo.css">
    <link rel="shortcut icon" href="<?php echo URL; ?>/img/favicon.ico">
</head>
<body>
    <?php 
        include '../app/Views/cabecalho/topo.php';
        $rotas = new Rota();
        include '../app/Views/cabecalho/footer.php';
    ?>
<script src="<?=URL?>/public/js/boostrap.js"></script>
</body>
</html>