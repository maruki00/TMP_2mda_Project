<?php


!defined("DS")?define("DS",DIRECTORY_SEPARATOR,true):null;
!defined("__SYS__")?define("__SYS__",realpath(__DIR__).DS.'..'.DS.'system',true):null;
!defined("__CTL__")?define("__CTL__",realpath(__DIR__).DS.'..'.DS.'controllers',true):null;
!defined("__MDL__")?define("__MDL__",realpath(__DIR__).DS.'..'.DS.'models',true):null;


!defined("DB_HOST")?define("DB_HOST","127.0.0.1",true):null;
!defined("DB_PORT")?define("DB_PORT",3306,true):null;
!defined("DB_NAME")?define("DB_NAME","sn",true):null;
!defined("DB_USER")?define("DB_USER","root",true):null;
!defined("DB_PASS")?define("DB_PASS","user",true):null;
