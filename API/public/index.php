<?php


use API\SYSTEM\app;
require_once "./config.php";
require_once "../system/autoloader.php";
require_once "web.php";

$app = App::newApp();
$app->run();


