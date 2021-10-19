<?php

namespace API\MODELS;
use API\SYSTEM\Model;

class  followersmodel extends Model{
    
    public $id;
    public $follower_from_user_id;
    public $followed_to_user_id;

    public static $tableName = "followers";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id"=>"DATA_TYPE_STR",
        "follower_from_user_id"=>"DATA_TYPE_STR",
        "followed_to_user_id"=>"DATA_TYPE_STR"
    );
}