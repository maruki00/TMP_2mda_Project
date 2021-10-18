<?php

namespace API\SYSTEM;
use API\SYSTEM\Autoloader;

class Autoloader{
    public static function Load($className){
        $class = $className;
        if(strpos($class,"SYSTEM")){
            $class = str_replace("API\\SYSTEM\\","",$class);
            $class =strtolower($class);
            $class = __SYS__.DS.$class.'.php';
        }else if(strpos($class,"Controller")){
            $class = str_replace("API\\CONROLLERS\\","",$class);
            $class =strtolower($class);
            $class = __CTL__.DS.$class.'.php';
        }else if(strpos($class,"Model")){
            $class = str_replace("API\\MODELS\\","",$class);
            $class =strtolower($class);
            $class = __MDL__.DS.$class.'.php';
        }
        //print $class."<br>";
        if(file_exists($class)){
        	require_once $class;
        }		
    }
}
spl_autoload_register(__NAMESPACE__."\\Autoloader::Load");
    