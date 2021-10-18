<?php
/*********************************************************************************
*                              Author: Author Name                               *
*           File Name: /home/user/Desktop/project/API/public/index.php           *
*                    Creation Date: October 14, 2021 08:04 PM                    *
*                    Last Updated: October 18, 2021 12:12 PM                     *
*                              Source Language: php                              *
*********************************************************************************/
//session_start();
use API\SYSTEM\app;
use API\MODELS\usersModel;

require_once "./config.php";
require_once "../system/autoloader.php";
require_once "web.php";
//$app = App::newApp();
//$app->run();
$rand_token = openssl_random_pseudo_bytes(32);
//change binary to hexadecimal
$token = bin2hex($rand_token);
//token generated
echo $token;
//print session_id();
//session_destroy();
