<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;
use API\MODELS\followersmodel;
use API\CONTROLLERS\userscontroller;

class followerscontroller extends Controller{
    private $follower;
    public function add(){
        if(isset($_POST['token'])&&isset($_POST['user_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                //$token = "Z05LSy9QQldRTERwZTZ6QVdwV3UwdzNPL3Q4eHI5OEYwREVmV1hQVzNqdHhXUTNyZWt4RDJLNTkrbTRCakcrSXBTR2JTRmxvWm1ZdjlVKzB5T3kxQWtzczBqUHN0NGFQS0NZTzBMSXowWTQ9";
                $data = Helper::parseAccessToken($_POST['token']);
                $this->follower                 = new followersmodel();
                $this->follower->id             = 1;
                $this->follower->follower       = $data[0]; 
                $this->follower->followed       = $_POST['user_id']; 
                $res                            = $this->follower->create();
                if($res){
                    echo json_encode(array("Success"=>"Followed..."));
                }else{
                    echo json_encode(array("Error"=>"Invalide Data..."));
                }
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
            echo json_encode(array("Error"=>"Invalide Data..."));
        }
    }
    public function delete(){
        if(isset($_POST['token'])&&isset($_POST['user_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $this->follower = followersmodel::where("follower","=",$data[0],"and","followed","=",$_POST['user_id']);
                $this->follower = is_array($this->follower)?array_shift($this->follower):$this->follower;
                $res = $this->follower->delete();
                if($res){
                    echo json_encode(array("Success"=>"Unfollowed..."));
    
                }else{
                    echo json_encode(array("Error"=>$_POST['token']." -=> You are not allowed..."));
                }
            }else{
                echo json_encode(array("Error"=>"51 You are not allowed..."));
            }
        }else{
            echo json_encode(array("Error"=>"Invalide Data..."));
        }
    }
}