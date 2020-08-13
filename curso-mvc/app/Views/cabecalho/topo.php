<!doctype html>
<html lang="pt-br" class="h-100">
<body class="d-flex flex-column h-100">
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand text-success" href="<?php echo URL; ?>">Samel Atendimento</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto mb-2 mb-md-0">
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo URL; ?>">Início</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<?php echo URL; ?>/pages/sobre">Sobre nós</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a class="btn btn-info" href="<?php echo URL ?>/usuarios/cadastrar">Cadastre-se</a>
                        <button class="ml-2 btn btn-success" type="submit">Entrar</button>
                    </form>
                </div>
            </div>
        </nav>
    </header>
    