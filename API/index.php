

<?php
/*********************************************************************************
*                           Author: Абдуллах Улахияне                            *
*           File Name: /home/user/Desktop/project/API/public/index.php           *
*                    Creation Date: October 14, 2021 08:04 PM                    *
*                    Last Updated: October 19, 2021 03:09 PM                     *
*                              Source Language: php                              *
*********************************************************************************/

//session_start();
use API\SYSTEM\app;
use API\MODELS\usersModel;


require_once "public/config.php";
require_once "system/autoloader.php";
require_once "public/web.php";

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET,POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");




$app = App::newApp();
$app->run();



//try{
//$cnx = new PDO("mysql://hostname=127.0.0.1;dbname=sn;","root","user");
//$sql = "INSERT INTO users SET username = ? ,password = ? ,accessToken = ? ,fullname = ? ,address_email = ? ,phone_number = ? ,last_access = ? ,role = ? ";
//$stmt = $cnx->prepare($sql);
//$arr = array("fgdddfgasd","0dd703ddd8017214b11a55e3bfdd8760437a0a69e678ee3f6a4dbf1a98f3ac251a7",
//              "4pcz3BOshnfBdIedddJZ7HjK6I7jw6Pg72B7ykc2BgMeqkPdFyiQcMPEi3tsUQDd8GEFauO9AJ4t05F8g5bTuDUQbwKREtxiusbv7TNrN5XG8o=",
//                "asdfgfds","gadsfg","adsfgadsfg","19/10/2021",1);
//echo "<pre>";
//print_r($arr);
//echo "</pre>";
//
//echo $stmt->execute($arr);
//}catch(PDOException $err){ 
//    echo "<br>=============================================<br>".$err.getMessage();}



