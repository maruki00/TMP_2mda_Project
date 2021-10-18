<?php


use API\SYSTEM\app;
use API\MODELS\userModel;

require_once "./config.php";
require_once "../system/autoloader.php";
require_once "web.php";

$app = App::newApp();
$app->run();



$u = new userModel();

$u->id=1;
$u->username="updated";
$u->password="updated";
$u->accessToken="updated";
$u->fullname="updated";
$u->address_email="updated";
$u->phone_number="updated";
$u->last_access="updated";
$u->role="0";
print $u->delete();