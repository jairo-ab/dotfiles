<?php

class Paginas extends Controller {

    public function index(){
        $dados = [
            'tituloPagina' => 'Página Inicial'
        ];

        $this->view('/pages/home', $dados);
    }

    public function sobre(){
        $dados = [
            'tituloPagina' => APP_NOME
        ];

        $this->view('/pages/sobre', $dados);
    }
}