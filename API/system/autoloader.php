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
        }else if(1){

        }
        if(file_exists($class)){
        	require_once $class;
        }		
    }
}
spl_autoload_register(__NAMESPACE__."\\Autoloader::Load");
    