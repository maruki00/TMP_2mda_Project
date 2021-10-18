<?php

/*********************************************************************************
*                           Author: Абдуллах Улахияне                            *
*        File Name: /home/user/Desktop/project/API/system/autoloader.php         *
*                    Creation Date: October 17, 2021 07:05 PM                    *
*                    Last Updated: October 18, 2021 12:37 PM                     *
*                              Source Language: php                              *
*********************************************************************************/


namespace API\SYSTEM;
use API\SYSTEM\Autoloader;

class Autoloader{
    public static function Load($className){
        $class = $className;
        if(strpos($class,"SYSTEM")){
            $class = str_replace("API\\SYSTEM\\","",$class);
            $class =strtolower($class);
            $class = __SYS__.DS.$class.'.php';
            
        }else if(strpos($class,"controller")){
            $class = str_replace("API\\CONTROLLERS\\","",$class);
            $class =strtolower($class);
            $class = __CTL__.DS.$class.'.php';
        }else if(strpos($class,"model")){
            $class = str_replace("API\\MODELS\\","",$class);
            $class =strtolower($class);
            $class = __MDL__.DS.$class.'.php';
        }
        if(file_exists($class)){
        	require_once $class;
        }		
    }
}
spl_autoload_register(__NAMESPACE__."\\Autoloader::Load");
    