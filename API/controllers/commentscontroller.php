<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\commentsmodel;

class commentscontroller extends Controller{
    private $comment;
    //id
    //comment_body
    //commented_date
    //user_id
    //post_id

    public function add(){
        $this->comment=new commentsmodel();
        $this->comment->id = 1;
        $this->comment->comment_body = $this->params['comment_body'];
        $this->comment->commented_date = date('d/m/Y');
        $this->comment->user_id = $this->params['user_id'];
        $this->comment->post_id = $this->params['post_id'];
        $res = $this->comment->create();
        if($res){
            echo json_encode(array("message"=>"Comment Added Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Add Comment"));
        }
    }

    public function delete(){
        $this->comment=commentsmodel::where("id","=",$this->params['id']);
        $res = $this->comment->delete();
        if($res){
            echo json_encode(array("message"=>"Comment Deleted Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Deleted Comment"));
        }
    }

    public function update(){
        $this->comment=new commentsmodel();
        $this->comment->id = $this->params['id'];
        $this->comment->comment_body = $this->params['comment_body'];
        $this->comment->user_id = $this->params['user_id'];
        $this->comment->post_id = $this->params['post_id'];
        $res = $this->comment->update();
        if($res){
            echo json_encode(array("message"=>"Comment Updated Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Updated Comment"));
        }
    }

    public function get(){
        $this->comment=commentsmodel::where('post_id','=',$this->params['post_id']);
        if($this->comment){
            echo json_encode(array("Count" => count($this->comment)));
        }else{
            echo json_encode(array("message"=>"Failed to Updated Comment"));
        }
    }

    
}