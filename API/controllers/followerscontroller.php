<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\followersmodel;
use API\MODELS\usersmodel;

class followerscontroller extends Controller{
    private $follower;
    public function add(){
        if(static::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->follow = new followersmodel();
            $this->follower->id                     = 1;
            $this->follower->follower_from_user_id  = $data[0]; 
            $this->follower->followed_to_user_id    = $this->params['followed_to_user_id']; 
            $res = $this->follower->create();
            if($res){
                echo json_encode(array("message"=>"Followed Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Follow this user"));
            } 
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }
    public function delete(){
        if(static::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->follow = followersmodel::where("follower_from_user_id","=",$data[0],"and","followed_to_user_id","=",$this->params['followed_to_user_id']);
            $res = $this->follower->delete();
            if($res){
                echo json_encode(array("message"=>"Unfollowed Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Unfollow this user"));
            } 
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }
}