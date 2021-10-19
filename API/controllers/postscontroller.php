<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\postsmodel;

class postscontroller extends Controller{
    private $post=null;
    public function add(){
        $this->post = new postsmodel();
        $this->post->id = 1;
        $this->post->post_body = $this->params['post_body'];
        $this->post->posted_date = date('d/m/Y');
        $this->post->user_id = (int)$this->params['user_id'];
        $res = $this->post->create();
        if($res){
            echo json_encode(array("message"=>"Post Added Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Add Post"));
        }
    }

    public function delete(){
        $this->post = new postsmodel();
        $this->post->id = $this->params['id'];
        $res = $this->post->delete();
        if($res){
            echo json_encode(array("message"=>"Post Deleted Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Delete Post"));
        }
    }

    public function update(){
        $this->post = new postsmodel();
        $this->post->id =          $this->params['id'];
        $this->post->post_body =   $this->params['post_body'];
        $this->post->posted_date = date('d/m/Y');
        $this->post->user_id =     $this->params['user_id'];
        $res = $this->post->update();
        if($res){
            echo json_encode(array("message"=>"Post Updated Successfully"));
        }else{
            echo json_encode(array("message"=>"Failed to Update Post"));
        }
    }

    public function getById(){
        $this->post = postsmodel::where("id","=",$this->params['id']);
        if($this->post){
            echo json_encode($this->post);
        }else{
            echo json_encode(array("message"=>"Failed to fetch Post"));
        }
    }

    public function getAll(){
        $this->post = postsmodel::where("user_id","=",$this->params['id']);
        if($this->post){
            echo json_encode($this->post);
        }else{
            echo json_encode(array("message"=>"Failed to fetch Post"));
        }
    }

}