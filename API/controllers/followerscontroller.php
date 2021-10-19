<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\followersmodel;

class followerscontroller extends Controller{
    private $follower;
    public function add(){
        $this->follow = new followersmodel();
        $this->follower->id                     = 1;
        $this->follower->follower_from_user_id  = $this->params['follower_from_user_id']; 
        $this->follower->followed_to_user_id    = $this->params['followed_to_user_id']; 
        $res = $this->follower->create();
        if($res){
            echo json_encode(array("message"=>"Followed Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Follow this user"));
        } 
    }
    public function delete(){
        $this->follow = followersmodel::where("follower_from_user_id","=",$this->params['follower_from_user_id'],"and","followed_to_user_id","=",$this->params['followed_to_user_id']);
        $res = $this->follower->delete();
        if($res){
            echo json_encode(array("message"=>"Unfollowed Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Unfollow this user"));
        } 
    }
}