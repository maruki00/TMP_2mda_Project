<?php

namespace API\MODELS;
use API\SYSTEM\Model;

class  followersmodel extends Model{
    
    public $id;
    public $follower;
    public $followed;

    public static $tableName = "followers";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id"=>"DATA_TYPE_STR",
        "follower"=>"DATA_TYPE_STR",
        "followed"=>"DATA_TYPE_STR"
    );
}