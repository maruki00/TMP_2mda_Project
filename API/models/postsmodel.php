<?php

namespace API\MODELS;
use API\SYSTEM\Model;


class postsmodel extends Model {
    public $id;
    public $post_body;
    public $posted_date;
    public $user_id;

    public static $tableName = "posts";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id" => "DATA_TYPE_STR",
        "post_body" => "DATA_TYPE_STR",
        "posted_date" => "DATA_TYPE_STR",
        "user_id" => "DATA_TYPE_STR"
    );

}
