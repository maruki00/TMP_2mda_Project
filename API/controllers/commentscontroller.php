<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;
use API\MODELS\commentsmodel;
use API\CONTROLLERS\userscontroller;


class commentscontroller extends Controller{
    private $comment;
    //id
    //comment_body
    //commented_date
    //user_id
    //post_id

    public function add(){
        if(isset($_POST['token'])&&isset($_POST['body'])&&isset($_POST['post_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $this->comment=new commentsmodel();
                $this->comment->id = 1;
                $this->comment->comment_body = $_POST['body'];
                $this->comment->commented_date = Helper::now();
                $this->comment->user_id = $data[0];
                $this->comment->post_id = $_POST['post_id'];
                $res = $this->comment->create();
                if($res){
                    echo json_encode(array("Success"=>"Comment Added Successfully"));
                }else{
                    echo json_encode(array("Error"=>"Failed to Add Comment"));
                }
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
                    echo json_encode(array("Error"=>"Invalide Data..."));
                }
    }
    public function delete(){
        if(isset($_POST['token'])&&isset($_POST['comment_id'])&&isset($_POST['post_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $this->comment=commentsmodel::where('id','=',$_POST['comment_id'],'and','post_id','=',$_POST['post_id']);
                $res = is_array($res)?array_shift($res):$res;
                if($res){
                    $res->delete();
                    echo json_encode(array("Success"=>"Comment Added Successfully"));
                }else{
                    echo json_encode(array("Error"=>"Failed to Add Comment"));
                }
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
                    echo json_encode(array("Error"=>"Invalide Data..."));
                }
    }
//$comments =   commentsmodel::exec("select id,comment_body,commented_date,(select fullname from users where id=c.user_id) as user,(select imagepath from users where id=c.user_id) as userimage from comments c where post_id=".$_POST['id']);

    public function get(){
        if(isset($_POST['token'])&&isset($_POST['post_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $this->comment=commentsmodel::exec("select *,(select fullname from users where id=c.user_id) as user,(select imagepath from users where id=c.user_id) as userimage from comments c where c.post_id=".$_POST['post_id']);
                if($this->comment){
                    echo json_encode($this->comment);
                }else{
                    echo json_encode(array("Error"=>"Failed to fetch Comments"));
                }
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            }
        }else{
            echo json_encode(array("Error"=>"Invalide data..."));
        }
    
    }

    
}