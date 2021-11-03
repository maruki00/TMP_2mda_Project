<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;
use API\MODELS\likesmodel;
use API\CONTROLLERS\userscontroller;

class likescontroller extends Controller{
    private $like;
    public function add(){
        if(userscontroller::isAuth($this->params['token'])){
            $data = Helper::parseAccessToken($this->params['token']);
            $this->like = new likesmodel();
            $this->like->id = 1;
            $this->like->user_id = $data[0];//$this->params['user_id']; 
            $this->like->post_id = $this->params['post_id']; 
            $res = $this->like->create();
            if($res){
                echo json_encode(array("Error"=>"Like Added Successfully"));
            }else{
                echo json_encode(array("Error"=>"Failed to Like post"));
            } 
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function delete(){
        if(userscontroller::isAuth($this->params['token'])){
            $data = Helper::parseAccessToken($this->params['token']);
            $this->like =likesmodel::where('user_id','=',$data[0],"and",'post_id','=',$this->params['post_id']);
            $res = $this->like->delete();
            if($res){
                echo json_encode(array("Error"=>"Like Deleted Successfully"));
            }else{
                echo json_encode(array("Error"=>"Failed to Unlike post"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function count(){
        if(userscontroller::isAuth($this->params['token'])){
            $this->like =likesmodel::where('post_id','=',$this->params['post_id']);
            if($res){
                echo json_encode(count($res));
            }else{
                echo json_encode(array("Error"=>"Failed to query"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
}