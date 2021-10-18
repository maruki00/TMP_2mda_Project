<?php

namespace API\MODELS;
use API\SYSTEM\Model;

class usersModel extends Model{
    public $id; 
    public $username;
    public $password;
    public $accessToken;
    public $fullname;
    public $address_email;
    public $phone_number;
    public $last_access; 
    public $role;


    public static $tableName = "users";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id"            =>  "DATA_TYPE_INT",
        "username"      =>  "DATA_TYPE_STR",
        "password"      =>  "DATA_TYPE_STR",
        "accessToken"   =>  "DATA_TYPE_STR",
        "fullname"      =>  "DATA_TYPE_STR",
        "address_email" =>  "DATA_TYPE_STR",
        "phone_number"  =>  "DATA_TYPE_STR",
        "last_access"   =>  "DATA_TYPE_STR",
        "role"          =>  "DATA_TYPE_STR"
    );
}