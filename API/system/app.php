<?php

namespace API\SYSTEM;

class App{
    // for sigleton
    private static $instance;
    //for router class
    protected static $uri       =[];
    protected static $actions   =[];
    protected static $method    =[];
    //for our app
    private $controller;
    private $action;
    private $params=[];
    private $callback;
    //private $uri="/";
    private function __construct(){
        $this->parseURL();
    }
    public static function newApp(){
        if(self::$instance == null) self::$instance = new static;
        return self::$instance;
    }
    private function parseURL(){
        $uri = $_SERVER['REQUEST_URI'];
        $uri = preg_replace("#(/)+#","/",$uri);
        foreach(self::$uri as $key=>$route){
            $tmp = $this->getPattern($route);
            if(preg_match("#^".$tmp."$#",$uri)){
                if(strtolower(self::$method[$key]) == strtolower($_SERVER["REQUEST_METHOD"])){
                    $this->getParams($route,$uri);
                    if(is_callable(self::$method[$key])){
                        $this->callback = self::$method[$key];
                    }else{
                        if(strpos(self::$method[$key],"@")){
                            $tmp = explode("@",self::$method[$key]);
                            if(is_array($tmp)){
                                if(isset($tmp[0])&& !empty($tmp[0]))
                                    $this->controller = $tmp[0];
                                if(isset($tmp[1])&&!empty($tmp[1]))
                                    $this->action = $tmp[1];
                            }
                        }
                    }
                }
            }
        }
    }
    private function getParams($route,$uri){
        $uri = explode("/",trim($uri,'/'));
        $route = explode('/',trim($route,'/'));
        foreach($route as $key=>$value){
            if(!empty($value)&&!empty($uri[$key])){
                if(preg_match("#^\{(.)+\}$#",$value)){
                    $var = str_replace(["{","}"],"",$value);
                    $this->params[$var] = $uri[$key];
                }
            }else{
                unset($uri[$key]);
                unset($route[$key]);
            }
        }
    }
    private function getPattern($route){
        $uri = $route;
        $uri = preg_replace("#(/)+#","/",$uri);
        $uri = explode("/",$uri);
        foreach($uri as $key=>$value){
            $uri[$key] = preg_replace("#{(.)+}#","(.)+",$value);
        }
        $uri = implode("/",$uri);
        return $uri;
    }
    public function run(){
        if($this->callback!=null) call_user_func($this->callback);
        else{
            $class = "";
            if(!empty($this->controller)){
                $class = "API\\Contreollers".strtolwer($this->controller)."Controller";
                $action = $this->action;
            }
            if(!class_exists($class)){
                $this->controller = "error";
                $class = "API\\Contreollers\\errorController";
                $action = "notfound";
            }
            if(!method_exists($class,$action)){
                $action = "notfound";
            }

            $cls = $class;
            $cls->setController($this->controller);
            $cls->setAction($this->action);
            $cls->setParams($this->params);
            $cls->$action();
        }		 
    }
}