<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\MODELS\postsmodel;
use API\MODELS\usersmodel;

class postscontroller extends Controller{
    private $post=null;
    public function add(){
        if(static::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->post = new postsmodel();
            $this->post->id = 1;
            $this->post->post_body = $this->params['post_body'];
            $this->post->posted_date = date('d/m/Y');
            $this->post->user_id = $data[0];
            $res = $this->post->create();
            if($res){
                echo json_encode(array("message"=>"Post Added Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Add Post"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

    public function delete(){
        if(static::isAuth($this->params['token'])){
            $this->post = new postsmodel();
            $this->post->id = $this->params['id'];
            $res = $this->post->delete();
            if($res){
                echo json_encode(array("message"=>"Post Deleted Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Delete Post"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

    public function update(){
        if(static::isAuth($this->params['token'])){
            $data = usersmodel::parseAccessToken($this->params['token']);
            $this->post = new postsmodel();
            $this->post->id =          $this->params['id'];
            $this->post->post_body =   $this->params['post_body'];
            $this->post->posted_date = date('d/m/Y');
            $this->post->user_id =     $data[0];
            $res = $this->post->update();
            if($res){
                echo json_encode(array("message"=>"Post Updated Successfully"));
            }else{
                echo json_encode(array("message"=>"Failed to Update Post"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

    public function getById(){
        if(static::isAuth($this->params['token'])){
            $this->post = postsmodel::where("id","=",$this->params['id']);
            if($this->post){
                echo json_encode($this->post);
            }else{
                echo json_encode(array("message"=>"Failed to fetch Post"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }
    

    public function getAll(){
        if(static::isAuth($this->params['token'])){
            $this->post = postsmodel::where("user_id","=",$this->params['id']);
            if($this->post){
                echo json_encode($this->post);
            }else{
                echo json_encode(array("message"=>"Failed to fetch Post"));
            }
        }else{
            echo json_encode(array("message"=>"You are not allowed..."));
        }
    }

}