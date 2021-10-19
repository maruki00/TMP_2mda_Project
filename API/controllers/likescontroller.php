<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\likesmodel;

class likescontroller extends Controller{
    private $like;
    public function add(){
        $this->like = new likesmodel();
        $this->like->id = 1;
        $this->like->user_id = $this->params['user_id']; 
        $this->like->post_id = $this->params['post_id']; 
        $res = $this->like->create();
        if($res){
            echo json_encode(array("message"=>"Like Added Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Like post"));
        } 
    }
    public function delete(){
        $this->like =likesmodel::where('user_id','=',$this->params['user_id'],"and",'post_id','=',$this->params['post_id']);
        $res = $this->like->delete();
        if($res){
            echo json_encode(array("message"=>"Like Deleted Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Unlike post"));
        }
    }
    public function count(){
        $this->like =likesmodel::where('user_id','=',$this->params['user_id'],"and",'post_id','=',$this->params['post_id']);
        $res = $this->like->delete();
        if($res){
            echo json_encode(array("message"=>"Like Deleted Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Unlike post"));
        }
    }
}