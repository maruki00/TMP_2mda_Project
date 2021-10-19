<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\commentsmodel;
use API\MODELS\usersmodel;

class commentscontroller extends Controller{
    private $comment;
    //id
    //comment_body
    //commented_date
    //user_id
    //post_id

    public function add(){
        if(usersmodel::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->comment=new commentsmodel();
            $this->comment->id = 1;
            $this->comment->comment_body = $this->params['comment_body'];
            $this->comment->commented_date = date('d/m/Y');
            $this->comment->user_id = $data[0];
            $this->comment->post_id = $this->params['post_id'];
            $res = $this->comment->create();
            if($res){
                echo json_encode(array("message"=>"Comment Added Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Add Comment"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

    public function delete(){
        if(usersmodel::isAuth($this->params['token'])){
            $this->comment=commentsmodel::where("id","=",$this->params['id']);
            $res = $this->comment->delete();
            if($res){
                echo json_encode(array("message"=>"Comment Deleted Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Deleted Comment"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

    public function update(){
        if(usersmodel::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->comment=new commentsmodel();
            $this->comment->id = $this->params['id'];
            $this->comment->comment_body = $this->params['comment_body'];
            $this->comment->user_id = $user[0];
            $this->comment->post_id = $this->params['post_id'];
            $res = $this->comment->update();
            if($res){
                echo json_encode(array("message"=>"Comment Updated Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Updated Comment"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

    public function get(){
        if(usersmodel::isAuth($this->params['token'])){
            $this->comment=commentsmodel::where('post_id','=',$this->params['post_id']);
            if($this->comment){
                echo json_encode(array("Count" => count($this->comment)));
            }else{
                echo json_encode(array("message"=>"Failed to Updated Comment"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

    
}