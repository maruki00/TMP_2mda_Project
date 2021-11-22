<?php

namespace API\MODELS;
use API\SYSTEM\Model;

class  commentsmodel extends Model{
    
    public $id; 
    public $comment_body; 
    public $commented_date;
    public $user_id; 
    public $post_id;

    public static $tableName = "comments";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id" => "DATA_TYPE_STR",
        "comment_body" => "DATA_TYPE_STR",
        "commented_date" => "DATA_TYPE_STR",
        "user_id" => "DATA_TYPE_STR",
        "post_id" => "DATA_TYPE_STR"
    );
}