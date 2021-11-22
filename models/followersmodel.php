<?php

namespace API\MODELS;
use API\SYSTEM\Model;

class  followersmodel extends Model{
    
    public $id;
    public $follower_id;
    public $followed_id;

    public static $tableName = "followers";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id"=>"DATA_TYPE_STR",
        "follower_id"=>"DATA_TYPE_STR",
        "followed_id"=>"DATA_TYPE_STR"
    );
}