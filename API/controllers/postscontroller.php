<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;
use API\MODELS\postsmodel;
use API\CONTROLLERS\userscontroller;
use API\MODELS\commentsmodel;
class postscontroller extends Controller{
    private $post=null;
    public function add(){
        if(isset($_POST['token'])&&isset($_POST['post'])) {
        if(userscontroller::isAuth($_POST['token'])){
            $data = Helper::parseAccessToken($_POST['token']);
            $this->post = new postsmodel();
            $this->post->id = 1;
            $this->post->post_body = $_POST['post'];
            $this->post->posted_date = Helper::now();
            $this->post->user_id = $data[0];
            $res = $this->post->create();
            if($res){
                echo json_encode(array("Message"=>"Post Added Successfully"));
            }else{
                echo json_encode(array("Error"=>"Failed to Add Post"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }}else{
            echo json_encode(array("Error"=>"Invalide Data..."));
        }
    }
    public function delete(){
        if(userscontroller::isAuth($this->params['token'])){
            $this->post = new postsmodel();
            $this->post->id = $this->params['id'];
            $res = $this->post->delete();
            if($res){
                echo json_encode(array("Message"=>"Post Deleted Successfully"));
            }else{
                echo json_encode(array("Error"=>"Failed to Delete Post"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function update(){
        if(userscontroller::isAuth($this->params['token'])){
            $data = Helper::parseAccessToken($this->params['token']);
            $this->post = new postsmodel();
            $this->post->id =          $this->params['id'];
            $this->post->post_body =   $this->params['post_body'];
            $this->post->posted_date = date('d/m/Y');
            $this->post->user_id =     $data[0];
            $res = $this->post->update();
            if($res){
                echo json_encode(array("Message"=>"Post Updated Successfully"));
            }else{
                echo json_encode(array("Error"=>"Failed to Update Post"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function getById(){
        if(isset($_POST['token'])&& isset($_POST['id'])&&userscontroller::isAuth($_POST['token'])){
            $id = Helper::parseAccessToken($_POST['token']);
            $this->posts = postsmodel::exec("select *,(select fullname from users where id=p.user_id) as user,(select imagepath from users where id=p.user_id) as userimage,(select count(*) from comments where post_id=p.id) as comments ,(select count(*) from likes where post_id=p.id) as likes, (select count(*) from likes where post_id=p.id and user_id=".$id[0].") as isliked from posts p where id=".$_POST['id']);
            if(isset($this->posts)){
                echo json_encode(array_shift($this->posts));
            }else{
                echo json_encode(array("Error"=>"Failed to fetch Post"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function getByUser(){
        if(isset($_POST['token'])&& isset($_POST['user_id'])&&userscontroller::isAuth($_POST['token'])){
            $id = Helper::parseAccessToken($_POST['token']);
            $this->posts = postsmodel::exec("select *,(select fullname from users where id=p.user_id) as user,(select imagepath from users where id=p.user_id) as userimage,(select count(*) from comments where post_id=p.id) as comments ,(select count(*) from likes where post_id=p.id) as likes, (select count(*) from likes where post_id=p.id and user_id=".$id[0].") as isliked from posts p where user_id=".$_POST['user_id']);
            if(isset($this->posts)){
                echo json_encode($this->posts);
            }else{
                echo json_encode(array("Error"=>"Failed to fetch Post"));
            }
        }else{
            echo json_encode(array("Error"=>"You are not allowed..."));
        }
    }
    public function feeds(){
        if(isset($_POST['token'])){
            $id = Helper::parseAccessToken($_POST['token']);
            $posts = postsmodel::exec("select *,(select fullname from users where id=p.user_id) as user,
                                                (select imagepath from users where id=p.user_id) as userimage,
                                                (select count(*) from comments where post_id=p.id) as comments ,
                                                (select count(*) from likes where post_id=p.id) as likes, 
                                                (select count(*) from likes where post_id=p.id and user_id=".$id[0].") as isliked 
                                                from posts p where user_id =".$id[0]." or user_id  in
                                (select followed from followers where follower=".$id[0].") order by id DESC;");
            if(isset($posts))
                echo json_encode($posts);
            else echo json_encode(array("posts"=>"Empty"));
        }else{
            json_encode(array("Error"=>"You are not allowed..."));
        }
    }
}