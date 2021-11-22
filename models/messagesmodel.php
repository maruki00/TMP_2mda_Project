<?php

namespace API\MODELS;
use API\SYSTEM\Model;

class  messagesmodel extends Model{
    
    public $id;
    public $message;
    public $messaged_date;
    public $user_id_from;
    public $user_id_to;

    public static $tableName = "messages";
    public static $primaryKey = "id";
    public static $tableSchema= array(
        "id"            => "DATA_TYPE_INT",
        "message"       => "DATA_TYPE_STR",
        "messaged_date" => "DATA_TYPE_STR",
        "user_id_from"  => "DATA_TYPE_STR",
        "user_id_to"    => "DATA_TYPE_STR",
    );
}


