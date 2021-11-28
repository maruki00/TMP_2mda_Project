<?php
namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;
use API\MODELS\usersmodel;
use API\MODELS\followersmodel;
use API\MODELS\postsmodel;
class userscontroller extends Controller{
    private $user = null;
    public function register(){
        if( isset($_POST['username']) &&
            isset($_POST['password']) &&
            isset($_POST['fullname']) &&
            isset($_POST['address_email']) &&
            isset($_POST['phone_number']) &&
            isset($_FILES['file'])){
            
            $extensions= array("jpeg","jpg","png");
            $file_name = $_FILES['file']['name'];
            $link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://".$_SERVER['HTTP_HOST']."/images/";
            $extension = explode('.',strtolower($file_name))[1];
            
            if(in_array($extension,$extensions)){
                $file = Helper::str_random(50).".".$extension;
                
                while(file_exists(__IMG__."/".$file)){
                    $file = Helper::str_random(50).".".$extension;
                }
                if(move_uploaded_file($_FILES['file']['tmp_name'],__IMG__."/".$file)){
                    error_log($_FILES['file']['name']);
                    $this->user = new usersmodel();
                    $tmp = usersmodel::last();
                    $this->user->id = $tmp?(int)$tmp->id+1:1;
                    $this->user->username = $_POST['username'];
                    $this->user->password = Helper::password($_POST['password']);
                    $this->user->accessToken = Helper::generate_accessToken($this->user->id,
                                                                            $this->user->username,
                                                                            $this->user->password);
                    $this->user->fullname = $_POST['fullname'];
                    $this->user->address_email = $_POST['address_email'];
                    $this->user->phone_number = $_POST['phone_number'];
                    $this->user->last_access = (new \DateTime())->format('Y-m-d H:i:s');
                    $this->user->imagepath = $link.$file;
                    $res = $this->user->create();
                    if($res){
                        echo json_encode(array("accesstoken"=>$this->user->accessToken));
                    }else{
                        echo json_encode(array("Error"=>"Failed to register"));
                    }   
                }else{
                    echo json_encode(array("Error"=>"Failed to register"));
                }
            }
            else{
                echo json_encode(array("Error"=>"Failed to register"));
            }
        }else{
            echo json_encode(array("Error"=>"Failed to register"));
        }
    }
    public function login(){
        if( isset($_POST['username']) &&
            isset($_POST['password'])){
        $this->user = usersmodel::where("username","=",$_POST['username'],"and",
                                  "password","=",Helper::password($_POST['password']));
        if($this->user){
               echo json_encode(array(
                    "id"=>           $this->user[0]->id,
                    "username"=>     $this->user[0]->username,
                    "fullname"=>     $this->user[0]->fullname,
                    "token"   =>     $this->user[0]->accessToken,
                    //"address_email"=>$this->user[0]->address_email,
                    //"phone_number"=> $this->user[0]->phone_number,
                )); 
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }}else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function profile(){
        if(isset($_POST['token'])){
        $this->user = usersmodel::where("accesstoken","=",$_POST['token']);
        if($this->user){
               echo json_encode(array(
                    "id"=>           $this->user[0]->id,
                    "username"=>     $this->user[0]->username,
                    "fullname"=>     $this->user[0]->fullname,
                    "address_email"=>$this->user[0]->address_email,
                    "phone_number"=> $this->user[0]->phone_number,
                    "imagepath"=>    $this->user[0]->imagepath,
                    "lastaccess"    => $data->last_access

                )); 
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }}else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public static function isAuth($token){
        
        $user = usersmodel::where("accesstoken","=",$token);
        if($user) return true;
        else return false;    
    }
    public function auth(){
        if(isset($_POST['token'])){
        if(static::isAuth($_POST['token'])){
            $this->user = usersmodel::where("accesstoken","=",$_POST['token']);
            if($this->user){
               echo json_encode(array(
                    "id"=>           $this->user[0]->id,
                    "username"=>     $this->user[0]->username,
                    "fullname"=>     $this->user[0]->fullname,
                    //"address_email"=>$this->user[0]->address_email,
                    //"phone_number"=> $this->user[0]->phone_number,
                ));
            }else{
                echo json_encode(array("Error"=>"Failed to auth"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }}else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
   
    public function followers(){
        if(isset($_POST['token'])){
            //$token = "Z05LSy9QQldRTERwZTZ6QVdwV3UwdzNPL3Q4eHI5OEYwREVmV1hQVzNqdHhXUTNyZWt4RDJLNTkrbTRCakcrSXBTR2JTRmxvWm1ZdjlVKzB5T3kxQWtzczBqUHN0NGFQS0NZTzBMSXowWTQ9";
            $id = Helper::parseAccessToken($_POST['token']);
            //$id = Helper::parseAccessToken($_POST['token']);
            $followers = usersmodel::exec("select * from users where id in (select followed from followers where follower=".$id[0].")");
            //echo json_encode(isset($followers)?$followers:array("Followers"=>"Empty"));
            
            if(isset($followers)){
                $users = array();
                foreach(is_Array($followers) ?$followers:[] as $data){
                    array_push($users,array(
                        "id"            => $data->id,
                        "username"      => $data->username,
                        "fullname"      => $data->fullname,
                        "address_email" => $data->address_email,
                        "phone_number"  => $data->phone_number,
                        "last_access"   => $data->last_access,
                        "imagepath"     => $data->imagepath,
                        "lastaccess"    => $data->last_access
                    ));
                }
                    echo json_encode($users);
            }else{
                echo json_decode(array("Followers"=>"empty"));
            }
        }else{
            echo json_encode(array(array("Error"=>"You are not allowed...")));
        }


        //"id": "73",
        //"username": 
        //"fullname": "sydydxy",
        //"address_email": "txxyyxyx",
        //"phone_number": "xyxyxyyc",
        //"last_access": "2021-11-14 09:03:08",
        //"imagepath": "http://192.168.0.100/images/7McCfR3wSa0xUy8gksBLdFiuXoDWA9QOJ1mzG6YjtNhVl4Z5HI.jpg"
    }
    public function  search(){
        if(isset($_POST['token'])&&isset($_POST['searchkey'])){
            $id = Helper::parseAccessToken($_POST['token']);
            $followers = usersmodel::exec("select * from users where address_email like '%".$_POST['searchkey']."%' or phone_number like '%".$_POST['searchkey']."%' or username  like '%".$_POST['searchkey']."%' or fullname like '%".$_POST['searchkey']."%'");
            if(isset($followers)){
                $users = array();
                foreach(is_array($followers)? $followers:[] as $data){
                    array_push($users,array(
                        "id"            => $data->id,
                        "username"      => $data->username,
                        "fullname"      => $data->fullname,
                        "address_email" => $data->address_email,
                        "phone_number"  => $data->phone_number,
                        "last_access"   => $data->last_access,
                        "imagepath"     => $data->imagepath,
                        "lastaccess"    => $data->last_access
                    ));
                }
                    echo json_encode($users);
            }else{
                echo json_decode(array("Followers"=>"empty"));
            }
        }else{
            echo json_encode(array(array("Error"=>"You are not allowed...")));
        }
    }
    public function getById(){
        if(isset($_POST['token'])&&isset($_POST['user_id'])){
            if(static::isAuth($_POST['token'])){
            $data = Helper::parseAccessToken($_POST['token']);
            $this->user = usersmodel::exec("select *,(select count(*) from followers where follower=".$data[0]." and followed= ".$_POST['user_id'].") as isfollow from users where id=".$_POST['user_id']);
            if($this->user){
                echo json_encode(array(
                        "id"=>           $this->user[0]->id,
                        "username"=>     $this->user[0]->username,
                        "fullname"=>     $this->user[0]->fullname,
                        "address_email"=>$this->user[0]->address_email,
                        "phone_number"=> $this->user[0]->phone_number,
                        "imagepath"=>    $this->user[0]->imagepath,
                        "isfollow"=>     $this->user[0]->isfollow,

                    )); 
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }}else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
                echo json_encode(array("Error"=>"Invalide Data..."));
           }
    }
}