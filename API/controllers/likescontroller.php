<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\likesmodel;
use API\MODELS\usersmodel;

class likescontroller extends Controller{
    private $like;
    public function add(){
        if(static::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->like = new likesmodel();
            $this->like->id = 1;
            $this->like->user_id = $data[0];//$this->params['user_id']; 
            $this->like->post_id = $this->params['post_id']; 
            $res = $this->like->create();
            if($res){
                echo json_encode(array("message"=>"Like Added Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Like post"));
            } 
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }
    public function delete(){
        if(static::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->like =likesmodel::where('user_id','=',$data[0],"and",'post_id','=',$this->params['post_id']);
            $res = $this->like->delete();
            if($res){
                echo json_encode(array("message"=>"Like Deleted Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Unlike post"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }
    public function count(){
        if(static::isAuth($this->params['token'])){
            $this->like =likesmodel::where('post_id','=',$this->params['post_id']);
            if($res){
                echo json_encode(count($res));
            }else{
                echo json_encode(array("message"=>"Failed to query"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }
}