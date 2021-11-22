<?php

namespace API\MODELS;
use API\SYSTEM\Model;

class  likesmodel extends Model{
    
    public $id;
    public $user_id;
    public $post_id;

    public static $tableName = "likes";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id" => "DATA_TYPE_STR",
        "user_id" => "DATA_TYPE_STR",
        "post_id" => "DATA_TYPE_STR"
    );
}