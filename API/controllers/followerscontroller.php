<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;
use API\MODELS\followersmodel;
use API\CONTROLLERS\userscontroller;

class followerscontroller extends Controller{
    private $follower;
    public function add(){
        if(userscontroller::isAuth($this->params['token'])){
            $data = Helper::parseAccessToken($this->params['token']);
            $this->follow = new followersmodel();
            $this->follower->id                     = 1;
            $this->follower->follower_id  = $data[0]; 
            $this->follower->followed_id    = $this->params['followed_id']; 
            $res = $this->follower->create();
            if($res){
                echo json_encode(array("Error"=>"Followed Successfully"));
            }else{
                echo json_encode(array("Error"=>"Failed to Follow this user"));
            } 
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function delete(){
        if(userscontroller::isAuth($this->params['token'])){
            $data = Helper::parseAccessToken($this->params['token']);
            $this->follow = followersmodel::where("follower_id","=",$data[0],"and","followed_id","=",$this->params['followed_id']);
            $res = $this->follower->delete();
            if($res){
                echo json_encode(array("Error"=>"Unfollowed Successfully"));
            }else{
                echo json_encode(array("Error"=>"Failed to Unfollow this user"));
            } 
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
}