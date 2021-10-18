<?php

namespace API\SYSTEM;

class Controller 
{
    private $controller;
    private $action;
    private $params;
    private $data;
    
    public function setController($controllerName){
        $this->controller  = $controllerName;
    }
    public function setAction($actionName){
        $this->action = $actionName;
    }
    public function setParams($paramsList){
        $this->params = $paramsList;
    }
    public function notfound(){
        $msg = array("message"=>"Error Some Thing wrrong...");
        echo json_encode($msg);
    }
    public function noviewfound(){
        return "";
    }
}
