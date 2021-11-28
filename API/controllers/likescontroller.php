<?php


namespace API\CONTROLLERS;
use API\SYSTEM\Controller;
use API\SYSTEM\Helper;
use API\MODELS\likesmodel;
use API\CONTROLLERS\userscontroller;

class likescontroller extends Controller{
    private $like;
    public function add(){
        if(isset($_POST['token'])&&isset($_POST['post_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $this->like = new likesmodel();
                $this->like->id = 1;
                $this->like->user_id = $data[0];
                $this->like->post_id = $_POST['post_id']; 
                $res = $this->like->create();
                if($res){
                    echo json_encode(array("Message"=>"Like Added Successfully"));
                }else{
                    echo json_encode(array("Error"=>"Failed to Like post"));
                } 
            }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            
            }
        }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            
            }
    }
    public function delete(){
        if(isset($_POST['token'])&&isset($_POST['post_id'])){
            if(userscontroller::isAuth($_POST['token'])){
                $data = Helper::parseAccessToken($_POST['token']);
                $res = likesmodel::where("user_id","=",$data[0],"and","post_id","=",$_POST['post_id']);
                $res = array_shift($res);
                if($res){
                    $res->delete();
                    echo json_encode(array("Message"=>"UnLiked Successfully"));
                }else{
                    echo json_encode(array("Error"=>"Failed to unLike post"));
                } 
            }else{
                echo json_encode(array("Error"=>"invalide data..."));
            
            }
        }else{
                echo json_encode(array("Error"=>"You are not allowed..."));
            
            }
    }
    //public function count(){
    //    if(userscontroller::isAuth($this->params['token'])){
    //        $this->like =likesmodel::where('post_id','=',$this->params['post_id']);
    //        if($res){
    //            echo json_encode(count($res));
    //        }else{
    //            echo json_encode(array("Error"=>"Failed to query"));
    //        }
    //    }else{
    //        echo json_encode(array("Error"=>"You are not allowed..."));
    //    }
    //}
}